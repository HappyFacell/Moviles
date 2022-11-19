import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import 'bloc/favorite_bloc.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  Future<void> _launchUrl(_url) async {
  _url = Uri.parse(_url);
  if (!await launchUrl(_url)) {
    throw 'Could not launch $_url';
  }
}


  late List<dynamic> _favorites;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff042442),
      appBar: AppBar(
        title: Text(
          'Favorites Songs',
          style: GoogleFonts.lato(),
        ),
        backgroundColor: const Color(0xff042442),
      ),
      body: BlocConsumer<FavoriteBloc, FavoriteState>(
        listener: (context, state) {
          
          if (state is FavoriteGetFavMusicSuccess) {
            _favorites = state.favorites;
          }
          if (state is FavoriteRemoveFavSongSuccess) {
            //success snackbar
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Song removed from favorites"),
                duration: Duration(seconds: 2),
              ),
            );
            BlocProvider.of<FavoriteBloc>(context)
                .add(GetFavoriteMusicEvent());
          }
        },
        builder: (context, state) {
          if (state is FavoriteGetFavMusicSuccess) {
            return SingleChildScrollView(
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (var i = 0; i < _favorites.length; i++)
                      cardGen(_favorites, i),
                  ],
                ),
              ),
            );
          } else if (state is FavoriteGetFavMusicLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is FavoriteGetFavMusicIsEmpty) {
            return const Center(
              child: Text("No favorite songs yet."),
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }

  Card cardGen(List<dynamic> favourites, var index) {
    return Card(
      elevation: 20,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: const Text("Do you want to go to the page of the song?"),
                    actions: [
                      TextButton(
                        child: const Text("Yes"),
                        onPressed: () {
                          Navigator.pop(context);
                          _launchUrl('${favourites[index]['listenLink']}');
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
            child: Image.network('${favourites[index]['albumCover']}'),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: IconButton(
              onPressed: () {
                //alert dialogue for removing favourite
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content:
                          const Text("Do you want to remove the song from favorites?"),
                      actions: [
                        TextButton(
                          child: const Text("Yes"),
                          onPressed: () {
                            Navigator.pop(context);
                            BlocProvider.of<FavoriteBloc>(context)
                                .add(RemoveFavoriteMusicEvent(index: index));
                          },
                        ),
                        TextButton(
                          child: const Text("No"),
                          onPressed: () {
                            //dismiss dialog
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              icon: const Icon(Icons.favorite),
              color: Colors.deepPurpleAccent,
              iconSize: 30,
            ),
          ),
          Column(
            children: [
              Center(
                child: Text(
                  '${favourites[index]['songName']}',
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontStyle: FontStyle.normal),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Center(
                child: Text(
                  '${favourites[index]['artistName']}',
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
