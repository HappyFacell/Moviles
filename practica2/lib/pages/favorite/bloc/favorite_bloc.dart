import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(FavoriteInitial()) {
    on<AddFavoriteMusicEvent>(addFavSong);
    on<RemoveFavoriteMusicEvent>(removeFavSong);
    on<GetFavoriteMusicEvent>(getFavList);
  }

  Future<void> addFavSong(
      AddFavoriteMusicEvent event, Emitter<FavoriteState> emitter) async {
    emit(AddFavSongLoading());

    try {
      DocumentReference<Map<String, dynamic>> userCollection =
          getUserCollection();

      Map<String, dynamic>? collection = (await userCollection.get()).data();

      if (collection == null) {
        print("Could not retrieve collection");
        return null;
      }
      List<dynamic> favourites = collection['user-favourites'];
      if (favourites.isEmpty) {
        favourites.add(event.favorite);
        await userCollection.update({'user-favourites': favourites});
        emit(AddFavSongSuccess());
      } else {
        for (var i in favourites) {
          if (i['songName'] == event.favorite['songName'] &&
              i['artistName'] == event.favorite['artistName']) {
            emit(AddFavSongExists());
            return;
          }
        }
        favourites.add(event.favorite);
        await userCollection.update({'user-favourites': favourites});
        emit(AddFavSongSuccess());
      }
    } catch (e) {
      emit(AddFavSongError());
    }
  }

  Future<void> removeFavSong(
      RemoveFavoriteMusicEvent event, Emitter<FavoriteState> emitter) async {
        emit(RemoveFavSongLoading());
    try {
      DocumentReference<Map<String, dynamic>> userCollection =
          getUserCollection();

      Map<String, dynamic>? collection = (await userCollection.get()).data();

      if (collection == null) {
        return null;
      }
      List<dynamic> favourites = collection['user-favourites'];
      favourites.removeAt(event.index);

      await userCollection.update({'user-favourites': favourites});
      emit(RemoveFavSongSuccess());
    } catch (e) {
      emit(RemoveFavSongError());
    }
      }

  Future<void> getFavList(
      GetFavoriteMusicEvent event, Emitter<FavoriteState> emitter) async {
        emit(GetFavMusicLoading());
    try {
      DocumentReference<Map<String, dynamic>> userCollection =
          getUserCollection();

      Map<String, dynamic>? collection = (await userCollection.get()).data();

      if (collection == null) {
        return null;
      }
      List<dynamic> favourites = collection['user-favourites'];
      if (favourites.isEmpty) {
        emit(GetFavMusicIsEmpty());
      } else {
        emit(GetFavMusicSuccess(favourites: favourites));
      }
    } catch (e) {
      emit(GetFavMusicError());
    }
      }

  DocumentReference<Map<String, dynamic>> getUserCollection() {
    final userCollection = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid);
    return userCollection;
  }
}
