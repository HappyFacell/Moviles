import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

int counter = 0;

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12),
        child: Column(
          children: [
            Image.network(
                "https://cruce.iteso.mx/wp-content/uploads/sites/123/2018/04/Portada-2-e1525031912445.jpg"),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("El ITESO, Universidad Jesuita de Guadalajara",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(
                      "San Pedro Tlaquepaque, Jal.",
                      style: TextStyle(color: Colors.grey[500]),
                    )
                  ],
                ),
                Expanded(child: Container()),
                IconButton(
                    onPressed: () {
                      print("Hola ${counter++}");
                    },
                    icon: const Icon(
                      Icons.thumb_up,
                      color: Colors.blue,
                    )),
                Text("${counter}"),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      IconButton(
                        iconSize: 48,
                        icon: const Icon(Icons.mail),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Enviando correo..."),
                            ),
                          );
                        },
                      ),
                      const Text("Correo")
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        iconSize: 48,
                        icon: const Icon(Icons.phone),
                        onPressed: () {},
                      ),
                      const Text("Llamar")
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        iconSize: 48,
                        icon: const Icon(Icons.directions),
                        onPressed: () {},
                      ),
                      const Text("Ruta")
                    ],
                  ),
                ],
              ),
            ),
            const Text(
              "El ITESO, Universidad Jesuita de Guadalajara (Instituto Tecnológico y de Estudios Superiores de Occidente), es una universidad privada ubicada en la Zona Metropolitana de Guadalajara, Jalisco, México, fundada en el año 1957.",
              textAlign: TextAlign.justify,
            )
          ],
        ),
      ),
    );
  }
}
