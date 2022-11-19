import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practica22/pages/auth/bloc/auth_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff042442),
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: const Color(0xff042442),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.gif'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 50),
                    Text(
                      "Shazam",
                      style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Image.asset(
                      "assets/images/shazam-logo.png",
                      height: 120,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 150),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25.0, 0, 25.0, 0),
                      child: ElevatedButton.icon(
                        icon: const FaIcon(
                          FontAwesomeIcons.google,
                        ),
                        onPressed: () {
                          BlocProvider.of<AuthBloc>(context)
                              .add(GoogleAuthEvent());
                        },
                        style: ElevatedButton.styleFrom(
                            foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                            minimumSize: const Size.fromHeight(50),
                            backgroundColor:
                                const Color.fromARGB(255, 252, 250, 249),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(1.0),
                            )),
                        label: const Text(
                          "Log in with Google",
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
