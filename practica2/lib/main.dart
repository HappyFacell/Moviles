import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'Pages/Home/bloc/homepage_bloc.dart';
import 'Pages/Home/home_page.dart';
import 'pages/favorite/provider/favorite_provider.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => HomepageBloc(),
      child: ChangeNotifierProvider(
        create: (context) => FavoriteProvider(),
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MusicFindApp',
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(),
      ),
      home: const HomePage(),
    );
  }
}
