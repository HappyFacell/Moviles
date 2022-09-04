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
            title: const Text('BirthDay Card'),
          ),
          body: Container(
            padding: const EdgeInsets.fromLTRB(20, 20, 0, 30),
            child: Column(
              children: [textTitle(), imageBirthday()],
            ),
          )),
    );
  }

  Container imageBirthday() {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 175, 0, 0),
      child: Row(children: [
        Image.network(
          'https://play-lh.googleusercontent.com/6oMCmm-wYu-7DfXaY5QevEv78RM0TNpXRQZeyToYNGrGPhr8nm8-Plav9fpoqeKn47Q',
          width: 150,
          height: 150,
        )
      ]),
    );
  }

  Row textTitle() {
    return Row(
      children: const [
        Text("Happy BirthDay Frank",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30))
      ],
    );
  }
}
