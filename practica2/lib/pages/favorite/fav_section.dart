import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'iterms_fav.dart';
import 'provider/favorite_provider.dart';

class FavSection extends StatelessWidget {
  const FavSection({super.key});
//Same logic as the Wallet app
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff042442),
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
