part of 'files_bloc.dart';

abstract class FilesState extends Equatable {
  const FilesState();

  @override
  List<Object> get props => [];
}

class FilesInitial extends FilesState {}

class LoadingState extends FilesState {}

class SaveFileSuccessState extends FilesState {}

class ReadFileErrorState extends FilesState {
  final String error;

  const ReadFileErrorState({required this.error});

  @override
  List<Object> get props => [error];
}

class SaveErrorState extends FilesState {
  final String error;

  const SaveErrorState({required this.error});

  @override
  List<Object> get props => [error];
}

class ReadFileSuccessState extends FilesState {
  final String fileContent;

  const ReadFileSuccessState({required this.fileContent});

  @override
  List<Object> get props => [fileContent];
}
