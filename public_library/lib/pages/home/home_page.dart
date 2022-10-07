import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:public_library/bloc/library_bloc.dart';

class HomePage extends StatelessWidget {
  final bookController = TextEditingController();
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LibreriaFreeToPlay'),
        backgroundColor: Colors.grey[800],
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 35, left: 25, right: 25),
        child: BlocConsumer<LibraryBloc, LibraryState>(
          listener: (context, state) {
            if (state is LibraryFoundState) {
              print(state);
            }
            else if (state is LibraryErrorState){
              print(state);
            }
            else if (state is LibraryLoadingState){
              print(state);
            }
            else if (state is LibraryInitialState) {
              print(state);
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
                            onPressed: () {
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
