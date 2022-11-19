import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practica22/Pages/Home/home_page.dart';
import 'package:practica22/Pages/login/login.dart';
import 'package:practica22/pages/auth/bloc/auth_bloc.dart';
import 'package:practica22/pages/favorite/bloc/favorite_bloc.dart';
import 'package:practica22/pages/home/bloc/home_page_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomePageBloc(),
        ),
        BlocProvider(create: (context) => AuthBloc()
            ..add(
              VerifyAuthEvent(),
            ),
            ),
        BlocProvider(
          create: (context) => FavoriteBloc(),
        ),
        
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FindTrackApp',
      theme: ThemeData.dark(),
      home: BlocConsumer<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccessState) {
            return const HomePage();
          } else if (state is UnAuthState ||
              state is AuthErrorState ||
              state is SignOutSuccessState) {
            return const LoginPage();
          }
          return const Center(
              child: const LoginPage(),
          );
        },
        listener: (context, state) {},
      ),
      // home: const HomePage(),
    );
  }
}
