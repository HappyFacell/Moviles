import 'package:flutter/material.dart';
import 'item_movie.dart';
import 'popcorns.dart';

class HomePage extends StatelessWidget {
  final _listElements = [
    {
      "title": "Star wars",
      "description": "Ranking: ★★★",
      "image": "https://i.imgur.com/tpHc9cS.jpg",
    },
    {
      "title": "Black widow",
      "description": "Ranking: ★★★★",
      "image": "https://i.imgur.com/0NTTbFn.jpg",
    },
    {
      "title": "Frozen 2",
      "description": "Ranking: ★★★",
      "image": "https://i.imgur.com/noNCN3V.jpg",
    },
    {
      "title": "Joker",
      "description": "Ranking: ★★★★",
      "image": "https://i.imgur.com/trdzMAl.jpg",
    },
  ];

  HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        title: const Text('Peliculas Favoritas'),
        backgroundColor: const Color.fromARGB(255, 64, 90, 238),
        centerTitle: true,
      ),
      body: Column(
        children: [listAligment(context), const Popcorn()],
      ),
    );
  }

  Container listAligment(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      height: MediaQuery.of(context).size.height / 4,
      child: movieList(),
    );
  }

  ListView movieList() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: _listElements.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () => {
            //show dialog
          },
          child: ItemMoie(
            content: _listElements[index],
          ),
        );
      },
    );
  }
}
