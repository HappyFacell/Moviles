part of 'favorite_bloc.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();
  
  @override
  List<Object> get props => [];
}

class FavoriteInitial extends FavoriteState {}

class GetFavMusicSuccess extends FavoriteState {
  final List<dynamic> favourites;

  GetFavMusicSuccess({required this.favourites});

  @override
  List<Object> get props => [this.favourites];
}

class GetFavMusicError extends FavoriteState {}

class GetFavMusicIsEmpty extends FavoriteState {}

class GetFavMusicLoading extends FavoriteState {}

class AddFavSongLoading extends FavoriteState {}

class AddFavSongSuccess extends FavoriteState {}

class AddFavSongError extends FavoriteState {}

class AddFavSongExists extends FavoriteState {}

class RemoveFavSongLoading extends FavoriteState {}

class RemoveFavSongSuccess extends FavoriteState {}

class RemoveFavSongError extends FavoriteState {}
