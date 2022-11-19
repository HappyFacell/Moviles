part of 'home_page_bloc.dart';

abstract class HomePageState extends Equatable {
  const HomePageState();
  
  @override
  List<Object> get props => [];
}

class HomePageInitialState extends HomePageState {}

class HomePageListeningState extends HomePageInitialState {}

class HomePageFinishedState extends HomePageInitialState {}

class HomePageMissingValuesState extends HomePageInitialState {}

class HomePageSuccessState extends HomePageInitialState {
  final String song, artist, album, date, apple, spotify, image, link;

  HomePageSuccessState({
    required this.song,
    required this.artist,
    required this.album,
    required this.date,
    required this.apple,
    required this.spotify,
    required this.image,
    required this.link,
  });
}

class HomePageErrorState extends HomePageInitialState {}
