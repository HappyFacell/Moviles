import 'package:flutter/material.dart';

class Popcorn extends StatefulWidget {
  const Popcorn({super.key});

  @override
  State<Popcorn> createState() => _PopcornState();
}

class _PopcornState extends State<Popcorn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Image.network(
            "https://miro.medium.com/max/702/1*Z27c1lyW5ZE9xn1w-IjiVQ.png",
            height: 50,
            width: 50,
          ),
          Text("Palomitas (Medianas)"),
        ],
      ),
    );
  }
}
