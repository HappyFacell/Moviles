import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:public_library/bloc/library_bloc.dart';
import 'package:public_library/pages/home/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LibreriaFreeToPlay',
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(),
      ),
      home: BlocProvider(
        create: (context) => LibraryBloc(),
        child: HomePage(),
      ),
    );
  }
}
