import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shimmer/flutter_shimmer.dart';
import 'package:public_library/bloc/library_bloc.dart';
import 'package:public_library/pages/Item/book_item.dart';

class HomePage extends StatelessWidget {
  final bookController = TextEditingController();
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LibreriaFreeToPlay'),
        backgroundColor: Colors.grey[700],
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: bookController,
              cursorColor: Colors.white,
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                fillColor: Colors.white,
                label: const Text(
                  'Search',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                focusedBorder: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  onPressed: () async {
                    print('Controller: ${bookController.text}');
                    BlocProvider.of<LibraryBloc>(context).add(
                      SearchEvent(bookTitle: bookController.text),
                    );
                  },
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<LibraryBloc, LibraryState>(
                builder: (context, state) {
                  if (state is LibraryInitialState) {
                    return const Center(
                      child: Text("Search your favorite book"),
                    );
                  }
                  if (state is LibraryErrorState) {
                    print("Fallo correctamente: $state");
                    //TODO: Buscar como meter un SnackBar
                    // _notFoundBooks(context);
                    // state = LibraryInitialState as LibraryState;
                    return const Center(
                      child: Text("Books not found, please try again."),
                    );
                  } else if (state is LibraryLoadingState) {
                    print("Buscando: $state");
                    return _lisview();
                  } else if (state is LibraryFoundState) {
                    print("Encontre: $state");
                    return _bookitems(state);
                  } else {
                    return const Center(
                      child: Text("Search your favorite book"),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListView _lisview() {
    return ListView.builder(
      itemCount: 30,
      itemBuilder: (BuildContext context, int index) {
        return const VideoShimmer();
      },
    );
  }

  Container _bookitems(LibraryFoundState state) {
    return Container(
      padding: const EdgeInsets.only(top: 8.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: state.libraries.length,
        itemBuilder: (BuildContext context, int index) {
          return BooksItems(books: state.libraries[index]);
        },
      ),
    );
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> _notFoundBooks(
      context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Libros no encontrados."),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
      ),
    );
  }
}
