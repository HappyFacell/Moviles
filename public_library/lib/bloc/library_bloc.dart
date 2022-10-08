

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:public_library/repo/request_repo.dart';


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

    try {
      booksList = await RequestBook.requestBooks.getLibrary(bookTitle);

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
