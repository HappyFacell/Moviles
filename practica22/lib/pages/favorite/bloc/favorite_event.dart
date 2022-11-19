part of 'favorite_bloc.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<dynamic> get props => [];
}


class GetFavoriteMusicEvent extends FavoriteEvent {}

class RemoveFavoriteMusicEvent extends FavoriteEvent {
  final int index;

  const RemoveFavoriteMusicEvent({required this.index});
  @override
  List<Object> get props => [index];
}

class AddFavoriteMusicEvent extends FavoriteEvent {
  final Map<String, dynamic> favorite;

  const AddFavoriteMusicEvent({required this.favorite});
  @override
  List<Object> get props => [favorite];
}
