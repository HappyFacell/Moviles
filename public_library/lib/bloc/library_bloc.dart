import 'dart:convert';


import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

part 'library_event.dart';
part 'library_state.dart';

class LibraryBloc extends Bloc<LibraryEvent, LibraryState> {
  LibraryState get initialState => LibraryInitialState();

  LibraryBloc() : super(LibraryInitialState()) {
    on<SearchEvent>(_searchBooks);
  }

  Future<dynamic> _searchBooks(SearchEvent event, Emitter emit) async {
    emit(LibraryLoadingState());

    String bookTitle = event.bookTitle;
    dynamic booksList;

    final request = Uri(
      scheme: "https",
      host: "www.googleapis.com",
      path: "books/v1/volumes",
      queryParameters: {"q": bookTitle},
    );

    try {
      dynamic response = await http.get(request);
      booksList = jsonDecode(response.body);

      if (booksList["items"] == null) {
        throw Exception();
      }

      emit(LibraryFoundState(libraries: booksList["items"]));

    } catch (e) {
      emit(
        const LibraryErrorState(
            message: "Error no se encontro ningun libro con ese titulo"),
      );
    }
  }
}
