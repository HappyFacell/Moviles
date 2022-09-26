import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  final IconData iconData;
  final Color bgColor;
  final String? textAction;
  final Function? action;

  
  const CircularButton(
      {super.key,
      required this.iconData,
      required this.bgColor,
      this.textAction,
      this.action});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          child: CircleAvatar(
            backgroundColor: bgColor,
            child: Icon(
              iconData,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(textAction ?? 'No action')
      ],
    );
  }
}
