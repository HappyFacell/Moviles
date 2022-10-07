part of 'library_bloc.dart';

abstract class LibraryState extends Equatable {
  const LibraryState();
  
  @override
  List<Object?> get props => [];
}

class LibraryInitialState extends LibraryState {}

class LibraryLoadingState extends LibraryState {}

class LibraryErrorState extends LibraryState{
  final String message;

  const LibraryErrorState({required this.message});

  @override
  List<Object?> get props => [];
}

class LibraryFoundState extends LibraryState {
  final List<dynamic> libraries;

  const LibraryFoundState({required this.libraries});

  @override
  List<Object?> get props => [libraries];

}

