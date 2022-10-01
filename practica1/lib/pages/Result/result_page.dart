import 'package:flutter/material.dart';
import 'package:practica1/pages/favorite/provider/favorite_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';




class ResultPage extends StatefulWidget {
  final song;
  final bool isFavorite;
  const ResultPage({
    super.key,
    this.song,
    required this.isFavorite,
  });

  @override
  State<ResultPage> createState() => _ResultPageState(
        song,
        isFavorite,
      );
}

Future<void> _launchUrl(_url) async {
  _url = Uri.parse(_url);
  if (!await launchUrl(_url)) {
    throw 'Could not launch $_url';
  }
}

class _ResultPageState extends State<ResultPage> {
  final Map<dynamic, dynamic> _song;
  bool _isFavorite;
  _ResultPageState(this._song, this._isFavorite);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff042442),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              //show favourite confirmation dialog
              showDialog(
                context: context,
                builder: (context) {
                  if (_isFavorite) {
                    //AlertDialog to delete or add to favorites list
                    return _alertDialog(
                        context,
                        "Remove from favorites",
                        "Do you want to remove the item from your favorites list?",
                        "Remove",
                        true);
                  }
                  else{
                    return _alertDialog(
                        context,
                        "Add to Favorites",
                        "Do you want to add the item to your favorites list?",
                        "Add",
                        false);
                  }
                },
              );
            },
            icon: _isFavorite
                ? const Icon(Icons.favorite)
                : const Icon(Icons.favorite_border),
          ),
        ],
        title: const Text(
          "Here you go",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xff042442),
      ),
      body: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.network("${widget.song["albumCover"]}"),
            const SizedBox(height: 20),
            Text("${widget.song["songName"]}",
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center),
            const SizedBox(height: 5),
            Text("${widget.song["artistName"]}",
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center),
            const SizedBox(height: 5),
            Text(
              "${widget.song["albumName"]}",
              style: const TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 5),
            Text(
              "${widget.song["releaseDate"]}",
              style: const TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const Divider(
              height: 30,
              thickness: 1,
              indent: 20,
              endIndent: 20,
              color: Colors.white,
            ),
            const Text(
              "Abrir con:",
              style: TextStyle(
                fontSize: 13,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  iconSize: 40,
                  onPressed: () {
                    _launchUrl("${widget.song["spotifyLink"]}");
                  },
                  icon: Image.asset(
                    'assets/images/spotify.png',
                    height: 30,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  iconSize: 40,
                  onPressed: () {
                    _launchUrl("${widget.song["listenLink"]}");
                  },
                  icon: const Icon(Icons.podcasts_rounded),
                  color: Colors.white,
                ),
                IconButton(
                  iconSize: 40,
                  onPressed: () {
                    _launchUrl("${widget.song["appleLink"]}");
                  },
                  icon: const Icon(Icons.apple),
                  color: Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  AlertDialog _alertDialog(BuildContext context, String title, String message,
      String actions, bool isNotFavorite) {
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () {
            if (isNotFavorite) {
              _isFavorite = false;
              setState(() {});
              context.read<FavoriteProvider>().removeFavorite(_song);
            } else {
              _isFavorite = true;
              setState(() {});
              context.read<FavoriteProvider>().addFavorite(_song);
            }
            Navigator.of(context).pop();
          },
          child: Text(actions),
        )
      ],
    );
  }
}

