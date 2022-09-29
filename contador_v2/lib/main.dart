import 'package:flutter/material.dart';
import 'package:contador_v2/pages/home/home_page.dart';
import 'package:contador_v2/provider/counting_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: ChangeNotifierProvider(
          create: (context) => Counting(),
          child: HomePage(),
        ),
      ),
    );
  }
}
