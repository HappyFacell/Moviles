part of 'favorite_bloc.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();
  
  @override
  List<Object> get props => [];
}

class FavoriteInitial extends FavoriteState {}

class FavoriteGetFavMusicSuccess extends FavoriteState {
  final List<dynamic> favorites;

  const FavoriteGetFavMusicSuccess({required this.favorites});

  @override
  List<Object> get props => [favorites];
}

class FavoriteGetFavMusicError extends FavoriteState {}

class FavoriteGetFavMusicIsEmpty extends FavoriteState {}

class FavoriteGetFavMusicLoading extends FavoriteState {}

class FavoriteAddFavSongLoading extends FavoriteState {}

class FavoriteAddFavSongSuccess extends FavoriteState {}

class FavoriteAddFavSongError extends FavoriteState {}

class FavoriteAddFavSongExists extends FavoriteState {}

class FavoriteRemoveFavSongLoading extends FavoriteState {}

class FavoriteRemoveFavSongSuccess extends FavoriteState {}

class FavoriteRemoveFavSongError extends FavoriteState {}
