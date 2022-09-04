import 'package:flutter/material.dart';

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
          body: Container(
            color: Colors.black,
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                opcion("12345", Icons.thumb_up),
                opcion("1234", Icons.thumb_down),
                opcion("123", Icons.play_arrow),
                opcion("12", Icons.share),
                opcion("1", Icons.download),
              ],
            ),
          )),
    );
  }

  Column opcion(String titulo, IconData icono) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icono,
          color: Colors.grey[200],
        ),
        Text(
          titulo,
          style: TextStyle(color: Colors.grey[200]),
        )
      ],
    );
  }
}