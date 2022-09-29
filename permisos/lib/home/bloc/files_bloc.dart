import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

part 'files_event.dart';
part 'files_state.dart';

class FilesBloc extends Bloc<FilesEvent, FilesState> {
  FilesBloc() : super(FilesInitial()) {
    on<ReadFileEvent>(_readFileFromStorage);
    on<SaveFileEvent>(_saveFileFromStorage);
  }

  FutureOr<void> _readFileFromStorage(ReadFileEvent event, emit) async {
    switch (event.storageName) {
      case "tempDirectory":
        var _tempDir = await getTemporaryDirectory();
        var _fileContent = await _readFile(event.fileTitle, _tempDir);
        emit(ReadFileSuccessState(fileContent: _fileContent));
        break;
      case "externalStorageDirectory":
        if (!await _requestStoragePermission()) {
          emit(ReadFileErrorState(
              error: 'Se requeire permiso para leer del almacenamiento'));
        } else {
          var _exDir = await getExternalStorageDirectory();
          var _fileContent = await _readFile(event.fileTitle, _exDir!);
          emit(ReadFileSuccessState(fileContent: _fileContent));
        }
        break;
      default:
    }
  }

  FutureOr<void> _saveFileFromStorage(SaveFileEvent event, emit) async {
    switch (event.storageName) {
      case "tempDirectory":
        var _tempDir = await getTemporaryDirectory();

        try {
          var _fileContent =
              await _saveFile(event.fileTitle, event.fileContent, _tempDir);
          emit(SaveFileSuccessState());
        } catch (e) {
          SaveErrorState(error: "No se ha podido guardar el archivo");
        }

        break;
      case "externalStorageDirectory":
        if (!await _requestStoragePermission()) {
          emit(SaveErrorState(
              error: 'Se requeire permiso para escribir en el almacenamiento'));
        } else {
          var _exDir = await getExternalStorageDirectory();
          try {
            var _fileContent =
                await _saveFile(event.fileTitle, event.fileContent, _exDir!);
            emit(SaveFileSuccessState());
          } catch (e) {
            SaveErrorState(error: "No se ha podido guardar el archivo");
          }
        }
        break;
      default:
    }
  }

  Future<bool> _requestStoragePermission() async {
    var permiso = await Permission.storage.status;

    if (permiso == PermissionStatus.denied) {
      await Permission.storage.request();
    }

    return permiso == PermissionStatus.granted;
  }

  Future<void> _saveFile(
      String _title, String content, Directory directory) async {
    if (!await _requestStoragePermission()) {
      throw Exception();
    }
    final File file = File('${directory.path}/$_title.txt');
    await file.writeAsString(content);
  }

  Future<String> _readFile(String _title, Directory directory) async {
    String _content = 'Not found';
    try {
      final File file = File('${directory.path}/$_title.txt');
      _content = await file.readAsString();
      return _content;
    } catch (e) {
      return _content;
    }
  }
}
