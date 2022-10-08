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

    // TODO: Cambio de estretegia implementar BlocBuilder, falta investigar mas acerca de su uso.
    return Scaffold(
      appBar: AppBar(
        title: const Text('LibreriaFreeToPlay'),
        backgroundColor: Colors.grey[800],
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 35, left: 25, right: 25),
        child: BlocConsumer<LibraryBloc, LibraryState>(
          listener: (context, state) {
            if (state is LibraryErrorState) {
              print("Fallo correctamente $state");
              ScaffoldMessenger.of(context)
                ..removeCurrentSnackBar()
                ..showSnackBar(
                  const SnackBar(
                    content: Text("Libros no encontrados."),
                    backgroundColor: Colors.red,
                  ),
                );
            } else if (state is LibraryLoadingState) {
              print("Buscando $state");
              ListView.builder(
                itemCount: 30,
                itemBuilder: (BuildContext context, int index) {
                  return const VideoShimmer();
                },
              );
            } else if (state is LibraryFoundState) {
              print("Encontre: $state\n");
              print('tamano: ${state.libraries.length}');
              Padding(
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
          },
          builder: (context, state) {
            return Column(
              children: [
                Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: TextField(
                        controller: bookController,
                        cursorColor: Colors.grey,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          fillColor: Colors.grey,
                          label: const Text(
                            'Search',
                            style: TextStyle(color: Colors.grey),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () async {
                              print('Controller: ${bookController.text}');
                              BlocProvider.of<LibraryBloc>(context).add(
                                SearchEvent(bookTitle: bookController.text),
                              );
                            },
                            icon: const Icon(
                              Icons.search,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
