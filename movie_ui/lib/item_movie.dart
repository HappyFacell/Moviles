import 'package:flutter/material.dart';

class ItemMoie extends StatelessWidget {
  const ItemMoie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          // Image.network(""),
          const Placeholder(
            fallbackHeight: 104,
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xEF4169D8),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15.0),
                ),
              ),
              child: Column(
                children: const [
                  Text(
                    "Titulo",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Ranking",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
