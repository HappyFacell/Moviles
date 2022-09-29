import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practica1/pages/Result/result_page.dart';
import 'package:practica1/pages/favorite/favorite_page.dart';

import 'bloc/homepage_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _listenStatus = 'Tap to Shazam';
  bool _animation = false;
  bool pressed = false;
  var _iconColor = Colors.white;
  var _song, _artist, _album, _date, _apple, _spotify, _cover, _link;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff042442),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: BlocConsumer<HomepageBloc, HomepageState>(
          listener: (context, state) {
            if (state is HomepageSuccessState) {
              print('It works $state');
              _song = state.song;
              _artist = state.artist;
              _album = state.album;
              _date = state.date;
              _apple = state.apple;
              _spotify = state.spotify;
              _cover = state.image;
              _link = state.link;

              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    song: {
                      "songName": _song,
                      "artistName": _artist,
                      "albumName": _album,
                      "releaseDate": _date,
                      "appleLink": _apple,
                      "spotifyLink": _spotify,
                      "albumCover": _cover,
                      "listenLink": _link,
                    },
                  ),
                ),
              );
              _animation = false;
              _listenStatus = 'Tap to Shazam';
              _iconColor = Colors.white;
            } else if (state is HomepageErrorState) {
              print('Fallo correctamente $state');
              _animation = false;
              _listenStatus = 'Tap to Shazam';
              _iconColor = Colors.white;
              ScaffoldMessenger.of(context)
                ..removeCurrentSnackBar()
                ..showSnackBar(
                  const SnackBar(
                    content: Text(
                        "The song could not be recognized, please try again."),
                    backgroundColor: Colors.red,
                  ),
                );
            } else if (state is HomepageFinishedState) {
              _animation = true;
              _listenStatus = 'Detecting your song...';
              _iconColor = Colors.deepPurple;
              print('$state');
            } else if (state is HomepageListeningState) {
              print('$state');
              _animation = true;
              _listenStatus = 'Listening...';
              _iconColor = Colors.deepPurple;
            } else if (state is HomepageInitialState) {
              print('$state');
            } else if (state is HomepageMissingValuesState) {
              print("$state");
              _animation = false;
              _listenStatus = "Tap to Shazam";
              _iconColor = Colors.white;
              ScaffoldMessenger.of(context)
                ..removeCurrentSnackBar()
                ..showSnackBar(
                  const SnackBar(
                    content: Text("The song was not found"),
                    backgroundColor: Colors.red,
                  ),
                );
            } else {
              _animation = false;
              _listenStatus = "Tap to Shazam";
            }
          },
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  _listenStatus,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                AvatarGlow(
                  endRadius: 200.0,
                  animate: _animation,
                  glowColor: Colors.deepPurple,
                  child: GestureDetector(
                    onTap: () {
                      pressed = true;
                      BlocProvider.of<HomepageBloc>(context)
                          .add(HomepageRecordUpdateEvent());
                    },
                    child: Material(
                      shape: const CircleBorder(),
                      elevation: 8,
                      child: Container(
                        padding: const EdgeInsets.all(40),
                        height: 200,
                        width: 200,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff089af8),
                        ),
                        child: Image.asset(
                          'assets/images/shazam-logo.png',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                // TODO: Crear provider para canciones favoritas y crear pagina de favoritos mandar ambos botones a la pagina
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const FavoritePage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    backgroundColor: Colors.white,
                  ),
                  child: const Icon(
                    Icons.favorite,
                    color: Colors.black,
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const FavoritePage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                    child: const Text(
                      'Ver favoritos',
                      style: TextStyle(color: Colors.black),
                    ))
              ],
            );
          },
        ),
      ),
    );
  }
}
