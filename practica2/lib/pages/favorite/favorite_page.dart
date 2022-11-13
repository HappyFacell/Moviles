import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'fav_section.dart';
import 'provider/favorite_provider.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff042442),
      appBar: AppBar(
        backgroundColor: const Color(0xff042442),
        title: const Text(
          'Favoites songs',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: context.watch<FavoriteProvider>().getFavorite.isNotEmpty
          ? const FavSection()
          : _noFavItems(),
    );
  }
}

//If you don't have favorite songs show a text indicating that you don't have anything yet
Column _noFavItems() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            "There are no favorite\nsongs yet",
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    ],
  );
}
