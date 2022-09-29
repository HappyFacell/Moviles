import 'package:flutter/material.dart';
import 'package:contador_v2/provider/counting_provider.dart';
import 'package:provider/provider.dart';

enum Colores {white,black, red,blue, green}

class HomePage extends StatelessWidget  {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var temp;

    return Container(
      child: Column(
        children: [
          //Base de color y contador
          Row(
            children: [
              Text("${context.watch<Counting>().getCount}"),
],
          ),
          //Botones de colores
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                ),
                onPressed: () {
                  temp = Colores.black.index;
                  print(temp);
                },
                child: const Text("BLACK"),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                ),
                onPressed: () {
                  temp = Colores.red.index;
                  print(temp);
                },
                child: const Text("RED"),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () {
                  temp = Colores.blue.index;
                  print(temp);
                },
                child: const Text("BLUE"),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green),
                ),
                onPressed: () {
                  temp = Colores.green.index;
                  print(temp);
                },
                child: const Text("GRREN"),
              ),
            ],
          ),
          //Botones de contador
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FloatingActionButton(
                onPressed: () {
                  context.read<Counting>().addCount();
                },
                child: const Icon(Icons.add),
              ),
              FloatingActionButton(
                onPressed: () {
                  context.read<Counting>().minusCount();
                },
                child: const Icon(Icons.remove),
              ),
              FloatingActionButton(
                onPressed: () {
                  context.read<Counting>().resetCount();
                },
                child: const Icon(Icons.refresh),
              )
            ],
          ),
        ],
      ),
    );
  }
}
