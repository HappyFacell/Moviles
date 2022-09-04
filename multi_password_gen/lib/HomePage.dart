import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String pass32 = "-";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generar Contraseñas'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView(
              children: [
                const Text("32 caracteres"),
                Row(
                  children: [
                    Expanded(child: Text(pass32)),
                    IconButton(
                      onPressed: () {
                        pass32 = generatePassword(32);
                        setState(() {});
                      },
                      icon: const Icon(Icons.refresh),
                    ),
                    IconButton(
                      onPressed: () {
                        Clipboard.setData(ClipboardData(text: pass32));

                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Copiando...")));
                      },
                      icon: const Icon(Icons.copy),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              pass32 = generatePassword(32);
              setState(() {});
            },
            child: const Text("Generar password"),
          ),
          ElevatedButton(
            onPressed: () {
              resetAll();
              setState(() {});
            },
            child: const Text("Borrar password"),
          ),
        ],
      ),
    );
  }

  String resetAll() => pass32 = "-";

  String generatePassword(int charsNum) {
    return String.fromCharCodes(
        List.generate(charsNum, (index) => Random().nextInt(48) + 60));
  }
}
