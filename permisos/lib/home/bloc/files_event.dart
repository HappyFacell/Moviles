part of 'files_bloc.dart';

abstract class FilesEvent extends Equatable {
  const FilesEvent();

  @override
  List<Object> get props => [];
}

class SaveFileEvent extends FilesEvent {
  final String fileTitle;
  final String fileContent;
  final String storageName;

  const SaveFileEvent({
    required this.fileTitle,
    required this.fileContent,
    required this.storageName,
  });

  @override
  List<Object> get props => [fileTitle, storageName];
}

class ReadFileEvent extends FilesEvent {
  final String fileTitle;
  final String fileContent;
  final String storageName;

  const ReadFileEvent({
    required this.fileTitle,
    required this.fileContent,
    required this.storageName,
  });

  @override
  List<Object> get props => [fileTitle, storageName];
}
