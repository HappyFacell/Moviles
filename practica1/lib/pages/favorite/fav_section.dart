import 'package:flutter/material.dart';
import 'package:practica1/pages/favorite/iterms_fav.dart';
import 'package:practica1/pages/favorite/provider/favorite_provider.dart';
import 'package:provider/provider.dart';

class FavSection extends StatelessWidget {
  const FavSection({super.key});

//Same logic as the Wallet app

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: context.watch<FavoriteProvider>().getFavorite.length,
              itemBuilder: (BuildContext context, int index) {
                return ItemFav(
                    favItem:
                        context.read<FavoriteProvider>().getFavorite[index]);
              },
            ),
          )
        ],
      ),
    );
  }
}
