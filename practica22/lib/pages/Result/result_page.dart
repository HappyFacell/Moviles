import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practica22/pages/favorite/bloc/favorite_bloc.dart';

import 'package:url_launcher/url_launcher_string.dart';

class ResultPage extends StatefulWidget {
  final song;
  const ResultPage({
    super.key,
    this.song,
  });

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  var _hearth = Icons.favorite_border;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff042442),
      appBar: AppBar(
        backgroundColor: const Color(0xff042442),
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
                        "Do you want to add this song to favorites?"),
                    actions: [
                      TextButton(
                        child: const Text("Yes"),
                        onPressed: () {
                          //add song to favourites
                          Map<String, dynamic> favorite = {
                            "artistName": "${widget.song["artistName"]}",
                            "songName": "${widget.song["songName"]}",
                            "albumCover": "${widget.song["albumCover"]}",
                            "listenLink": "${widget.song["listenLink"]}",
                          };
                          Navigator.pop(context);
                          BlocProvider.of<FavoriteBloc>(context).add(
                              AddFavoriteMusicEvent(favorite: favorite));
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
            icon: Icon(_hearth),
          ),
        ],
        title: const Text(
          "Here you go",
        ),
      ),
      body: BlocConsumer<FavoriteBloc, FavoriteState>(
        listener: (context, state) {
          print("Firebase Listener has been called");
          if (state is FavoriteAddFavSongSuccess) {
            print("$state");
            setState(() {
              _hearth = Icons.favorite;
            });
            ScaffoldMessenger.of(context)
              ..removeCurrentSnackBar()
              ..showSnackBar(const SnackBar(
                content: Text("The song has been added to favorites"),
                backgroundColor: Colors.deepPurpleAccent,
              ));
          } else if (state is FavoriteAddFavSongError) {
            print("$state");
            ScaffoldMessenger.of(context)
              ..removeCurrentSnackBar()
              ..showSnackBar(const SnackBar(
                content: Text(
                    "There was an error adding the song to favorites"),
                backgroundColor: Colors.red,
              ));
          } else if (state is FavoriteAddFavSongExists) {
            print("$state");
            setState(() {
              _hearth = Icons.favorite;
            });
            ScaffoldMessenger.of(context)
              ..removeCurrentSnackBar()
              ..showSnackBar(const SnackBar(
                content: Text("The song is already in favorites"),
                backgroundColor: Colors.deepPurple,
              ));
          } else if (state is FavoriteInitial) {
            print("$state");
          }
        },
        builder: (context, state) {
          return ListView(
            children: [
              Image.network("${widget.song["albumCover"]}"),
              const SizedBox(height: 10),
              Text("${widget.song["songName"]}",
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
              const SizedBox(height: 5),
              Text("${widget.song["artistName"]}",
                  style: const TextStyle(fontSize: 18),
                  textAlign: TextAlign.center),
              const SizedBox(height: 5),
              Text(
                "${widget.song["albumName"]}",
                style: const TextStyle(fontSize: 15),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5),
              Text(
                "${widget.song["releaseDate"]}",
                style: const TextStyle(fontSize: 15),
                textAlign: TextAlign.center,
              ),
              const Divider(
                height: 30,
                thickness: 1,
                indent: 20,
                endIndent: 20,
                color: Colors.black87,
              ),
              const Text(
                "Open with:",
                style: TextStyle(
                  fontSize: 13,
                ),textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    iconSize: 40,
                    onPressed: () {
                      launchUrlString("${widget.song["spotifyLink"]}",
                          mode: LaunchMode.externalApplication);
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
                      launchUrlString("${widget.song["listenLink"]}",
                          mode: LaunchMode.externalApplication);
                    },
                    icon: const Icon(Icons.podcasts_rounded),
                  ),
                  IconButton(
                    iconSize: 40,
                    onPressed: () {
                      launchUrlString("${widget.song["appleLink"]}",
                          mode: LaunchMode.externalApplication);
                    },
                    icon: const Icon(Icons.apple),
                    color: Colors.white,
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
