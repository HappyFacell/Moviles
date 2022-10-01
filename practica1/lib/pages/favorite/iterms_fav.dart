import 'package:flutter/material.dart';
import 'package:practica1/pages/Result/result_page.dart';
import 'package:practica1/pages/favorite/provider/favorite_provider.dart';
import 'package:provider/provider.dart';

class ItemFav extends StatefulWidget {
  //Same logic as the Wallet app
  final favItem;
  const ItemFav({
    super.key,
    this.favItem,
  });

  @override
  State<ItemFav> createState() => _ItemFavState();
}

class _ItemFavState extends State<ItemFav> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ResultPage(
                    song: widget.favItem,
                    isFavorite: true,
                  )),
        );
      },
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        height: 300,
        width: 300,
        child: Stack(
          children: [
            //TODO: Separar por metodos (Mayor facilidad de lectura)
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                  height: 300,
                  width: 300,
                  alignment: Alignment.center,
                  "${widget.favItem["albumCover"]}"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                  icon: const Icon(Icons.favorite),
                  onPressed: () => showDialog(
                        context: context,
                        builder: (context) => _deleteAlert(context),
                      )),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.7),
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(25.0),
                        bottomRight: Radius.circular(8.0),
                        bottomLeft: Radius.circular(8.0)),
                  ),
                  width: 300,
                  child: Column(
                    children: [
                      Text(
                        "${widget.favItem["songName"]}",
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text("${widget.favItem["artistName"]}")
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }



  AlertDialog _deleteAlert(BuildContext context) {
    return AlertDialog(
      title: const Text("Remove from favorites"),
      content: const Text(
          "Do you want to remove the item from your favorites list?"),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () {
            context.read<FavoriteProvider>().removeFavorite(widget.favItem);
            Navigator.of(context).pop();
          },
          child: const Text("Remove"),
        )
      ],
    );
  }
}
