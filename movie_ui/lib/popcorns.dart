import 'package:flutter/material.dart';

class Popcorn extends StatefulWidget {
  const Popcorn({super.key});

  @override
  State<Popcorn> createState() => _PopcornState();
}

class _PopcornState extends State<Popcorn> {
  final _pictureUrl =
      "https://freepngimg.com/thumb/popcorn/23411-8-popcorn-clipart.png";
  int palomitas = 0;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.network(_pictureUrl, fit: BoxFit.contain, height: 120),
          Column(
            children: [
              const Text("Palomitas medianas"),
              Text("$palomitas"),
              // podemos extraer methods para evitar mucha anidacion de parentesis
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      palomitas++;
                      setState(() {});
                    },
                    icon: const Icon(Icons.arrow_upward),
                  ),
                  IconButton(
                    onPressed: () {
                      if (palomitas > 0) {
                        palomitas--;
                      }
                      setState(() {});
                    },
                    icon: const Icon(Icons.arrow_downward),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
