part of 'homepage_bloc.dart';

@immutable
abstract class HomepageState extends Equatable {
  const HomepageState();

  @override
  List<Object> get props => [];
}

class HomepageInitialState extends HomepageState {}

class HomepageListeningState extends HomepageInitialState {}

class HomepageFinishedState extends HomepageInitialState {}

class HomepageMissingValuesState extends HomepageInitialState {}

class HomepageSuccessState extends HomepageInitialState {
  final String song, artist, album, date, apple, spotify, image, link;

  HomepageSuccessState({
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

class HomepageErrorState extends HomepageInitialState {}
