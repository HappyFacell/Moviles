part of 'library_bloc.dart';

abstract class LibraryEvent extends Equatable {
  const LibraryEvent();

  @override
  List<dynamic> get props => [];
}

class SearchEvent extends LibraryEvent {
  final String bookTitle;

  const SearchEvent({required this.bookTitle});

  @override
  List<dynamic> get props => [bookTitle];
}
