import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import 'package:requests_provider/home_page.dart';
import 'package:requests_provider/home_page2.dart';
import 'package:requests_provider/providers/users_data_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: ChangeNotifierProvider(
        create: (context) => UserDataProvider()..getUsers(),
        child: const HomePage2(),
      ),
    );
  }
}
