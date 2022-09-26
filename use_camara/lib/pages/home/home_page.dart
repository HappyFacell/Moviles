import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:use_camara/pages/bloc/picture_bloc.dart';
import 'circular_buttons.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your bank pro'),
      ),
      body: Column(
        children: [
          BlocConsumer<PictureBloc, PictureState>(
            listener: (context, state) {
              // TODO: implement listener
              if (state is PictureErrorState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.errorMsg),
                  ),
                );
              }
            },
            builder: (context, state) {
              if (state is PictureSelectedState) {
                return CircleAvatar(
                  radius: 84,
                  child: Image.file(state.picture),
                );
              }
              return Container();
            },
          ),
          const Text('Bienvenido'),
          Text('"User ${UniqueKey()}'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const CircularButton(
                bgColor: Colors.indigo,
                iconData: Icons.credit_card,
                textAction: 'Card',
              ),
              CircularButton(
                bgColor: Colors.orange,
                iconData: Icons.camera_alt_rounded,
                textAction: 'Take picture',
                action: (){
                  BlocProvider.of<PictureBloc>(context).add(CambiarFotoEvent());
                },
              ),
              const CircularButton(
                bgColor: Colors.green,
                iconData: Icons.play_arrow_rounded,
                textAction: 'Tutorial',
              ),
            ],
          )
        ],
      ),
    );
  }
}
