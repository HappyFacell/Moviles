import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet/providers/token_provider.dart';
import './pages/home/home_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TokensProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Material App', home: HomePage());
  }
}
