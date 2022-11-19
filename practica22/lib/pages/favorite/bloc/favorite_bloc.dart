import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(FavoriteInitial()) {
    on<AddFavoriteMusicEvent>(addFavSong);
    on<RemoveFavoriteMusicEvent>(rmFavSong);
    on<GetFavoriteMusicEvent>(getFavoriteList);
  }

  Future<void> addFavSong(
      AddFavoriteMusicEvent event, Emitter<FavoriteState> emitter) async {
    emit(FavoriteAddFavSongLoading());
    try {
      DocumentReference<Map<String, dynamic>> userCollection =
          getUserCollection();

      Map<String, dynamic>? collection = (await userCollection.get()).data();

      if (collection == null) {
        print("Could not retrieve collection");
        return;
      }
      List<dynamic> favorites = collection['user-favorites'];
      if (favorites.isEmpty) {
        favorites.add(event.favorite);
        await userCollection.update({'user-favorites': favorites});
        emit(FavoriteAddFavSongSuccess());
      } else {
        for (var i in favorites) {
          if (i['songName'] == event.favorite['songName'] &&
              i['artistName'] == event.favorite['artistName']) {
            emit(FavoriteAddFavSongExists());
            return;
          }
        }
        favorites.add(event.favorite);
        await userCollection.update({'user-favorites': favorites});
        emit(FavoriteAddFavSongSuccess());
      }
    } catch (e) {
      emit(FavoriteAddFavSongError());
    }
  }

  Future<void> rmFavSong(
      RemoveFavoriteMusicEvent event, Emitter<FavoriteState> emitter) async {
    emit(FavoriteRemoveFavSongLoading());
    try {
      DocumentReference<Map<String, dynamic>> userCollection =
          getUserCollection();

      Map<String, dynamic>? collection = (await userCollection.get()).data();

      if (collection == null) {
        return null;
      }
      List<dynamic> favourites = collection['user-favorites'];
      favourites.removeAt(event.index);

      await userCollection.update({'user-favorites': favourites});
      emit(FavoriteRemoveFavSongSuccess());
    } catch (e) {
      emit(FavoriteRemoveFavSongError());
    }
  }

  Future<void> getFavoriteList(event, emit) async {
    emit(FavoriteGetFavMusicLoading());
    try {
      DocumentReference<Map<String, dynamic>> userCollection =
          getUserCollection();

      Map<String, dynamic>? collection = (await userCollection.get()).data();

      if (collection == null) {
        return;
      }
      List<dynamic> favorites = collection['user-favorites'];
      if (favorites.isEmpty) {
        emit(FavoriteGetFavMusicIsEmpty());
      } else {
        emit(FavoriteGetFavMusicSuccess(favorites: favorites));
      }
    } catch (e) {
      emit(FavoriteGetFavMusicError());
    }
  }

  DocumentReference<Map<String, dynamic>> getUserCollection() {
    final userCollection = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid);
    return userCollection;
  }
}
