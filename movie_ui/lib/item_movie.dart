import 'package:flutter/material.dart';

class ItemMoie extends StatelessWidget {
  final Map<String, String> movieData;
  

  ItemMoie({Key? key, required this.movieData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Image.network("${movieData['image']}"),
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
                children: [
                  Text(
                    "${movieData["title"]}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "${movieData["description"]}",
                    style: const TextStyle(
                      color: Colors.white,
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
