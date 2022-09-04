import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Mi primer app'),
          backgroundColor: Colors.indigo[800],
        ),
        body: Container(
          margin: const EdgeInsets.all(12),
          padding: const EdgeInsets.all(10),
          color: Colors.orange,
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("San Francisco",
                    style: TextStyle(color: Colors.white, fontSize: 30)),
                const Text("Nublado", style: TextStyle(color: Colors.white)),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.cloud, size: 50, color: Colors.cyan[100]),
                      const Text("19 C",
                          style:
                              TextStyle(fontSize: 50, color: Colors.white)),
                    ]),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  MaterialButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content:
                                  Text("Actualizando datos del clima...")));
                    },
                    color: Colors.yellow,
                    child: const Text("Actualizar"),
                  )
                ])
              ]),
        ));
  }
}
