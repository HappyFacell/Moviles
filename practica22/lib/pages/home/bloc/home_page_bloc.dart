import 'dart:convert';
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../credential.dart';
import 'package:record/record.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(HomePageInitialState()) {
    on<HomePageRecordUpdateEvent>(_searchSong);
  }

  void _searchSong(HomePageEvent event, Emitter emit) async {
    final tmpPath = await _obtainTempPath();
    final filePath = await doRecording(tmpPath, emit);
    print("File path: $filePath");
    File file = File(filePath!);
    String fileString = await fileConvert(file);
    var json = await _recieveResponse(fileString);
    print("JSON: $json");

    if (json == null || json["result"] == null) {
      emit(HomePageErrorState());
    } else {
      try {
        final String song = json['result']['title'];
        final String artist = json['result']['artist'];
        final String album = json['result']['album'];
        final String date = json['result']['release_date'];
        final String apple = json['result']['apple_music']['url'];
        final String spotify =
            json['result']['spotify']['external_urls']['spotify'];
        final String image =
            json['result']['spotify']['album']['images'][0]['url'];
        final String link = json['result']['song_link'];

        emit(
          HomePageSuccessState(
            song: song,
            artist: artist,
            album: album,
            date: date,
            apple: apple,
            spotify: spotify,
            image: image,
            link: link,
          ),
        );
      } catch (e) {
        print("Error: $e");
        emit(HomePageMissingValuesState());
      }
    }
  }

  Future<String> _obtainTempPath() async {
    Directory tempDir = await getTemporaryDirectory();
    return tempDir.path;
  }

  Future<String?> doRecording(String tmpPath, Emitter<dynamic> emit) async {
    final Record _record = Record();
    try {
      bool permission = await _record.hasPermission();
      print("Permission: $permission");
      if (permission) {
        emit(HomePageListeningState());
        await _record.start(
          path: '${tmpPath}/test.m4a',
          encoder: AudioEncoder.aacLc,
          bitRate: 128000,
          samplingRate: 44100,
        );
        await Future.delayed(const Duration(seconds: 7));
        return await _record.stop();
      } else {
        emit(HomePageErrorState());
        print("Permission denied");
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future _recieveResponse(String file) async {
    emit(HomePageFinishedState());
    print("Enviando a la API");
    http.Response response = await http.post(
      Uri.parse('https://api.audd.io/'),
      headers: {'Content-Type': 'multipart/form-data'},
      body: jsonEncode(
        <String, dynamic>{
          'api_token': key,
          'return': 'apple_music,spotify',
          'audio': file,
          'method': 'recognize',
        },
      ),
    );
    if (response.statusCode == 200) {
      print("Success");
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load json');
    }
  }
}

Future<String> fileConvert(File file) async {
  List<int> fileBytes = await file.readAsBytes();
  String base64String = base64Encode(fileBytes);
  return base64String;
}
