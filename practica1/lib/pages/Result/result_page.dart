import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// final Uri _url = Uri.parse('https://flutter.dev');

class ResultPage extends StatefulWidget {
  final song;

  const ResultPage({super.key, this.song});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

Future<void> _launchUrl(_url) async {
  _url = Uri.parse(_url);
  if (!await launchUrl(_url)) {
    throw 'Could not launch $_url';
  }
}

class _ResultPageState extends State<ResultPage> {
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
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Favoritos"),
                    content: const Text(
                        "¿Quieres agregar esta canción a favoritos?"),
                    actions: [
                      TextButton(
                        child: const Text("Si"),
                        onPressed: () {
                          //add song to favourites
                          Map<String, dynamic> favourite = {
                            "artistName": "${widget.song["artistName"]}",
                            "songName": "${widget.song["songName"]}",
                            "albumCover": "${widget.song["albumCover"]}",
                            "listenLink": "${widget.song["listenLink"]}",
                          };
                        },
                      ),
                      TextButton(
                        child: const Text("No"),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  );
                },
              );
            },
            icon: const Icon(Icons.favorite_border),
          ),
        ],
        title: const Text(
          "Here you go",
          style: TextStyle(
            color: Colors.white
          ),
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
}
