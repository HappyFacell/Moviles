import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Pages/Home/bloc/homepage_bloc.dart';
import 'Pages/Home/home_page.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => HomepageBloc(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Material App', home: HomePage());
  }
}
