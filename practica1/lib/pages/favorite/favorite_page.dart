import 'package:flutter/material.dart';
import 'package:practica1/pages/favorite/fav_section.dart';
import 'package:practica1/pages/favorite/provider/favorite_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';



class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: context.watch<FavoriteProvider>().getFavorite.isNotEmpty
          ?  const FavSection()
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
            "There are no favorite songs yet",
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    ],
  );
}
