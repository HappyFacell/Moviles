import 'package:flutter/material.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({
    Key? key,
  }) : super(key: key);

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  bool isAccesibilitySelected = false; //
  bool isTimerSelected = false;
  bool isAndroidSelected = false;
  bool isIosSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('MC Flutter'),
        ),
        body: Container(
          margin: const EdgeInsets.all(15.0),
          padding: const EdgeInsets.all(3.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 25),
                decoration: const BoxDecoration(
                    border: Border(
                        top: BorderSide(width: 1.0, color: Colors.black),
                        left: BorderSide(width: 1.0, color: Colors.black),
                        right: BorderSide(width: 1.0, color: Colors.black))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: const [
                        Icon(
                          Icons.account_circle,
                          size: 45,
                        ),
                      ],
                    ),
                    Column(
                      children: const [
                        Text("FLUTTER McFLUTTER\nExperienced App Developer",
                            textDirection: TextDirection.ltr),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(7, 0, 7, 0),
                decoration: const BoxDecoration(
                    border: Border(
                        left: BorderSide(width: 1.0, color: Colors.black),
                        right: BorderSide(width: 1.0, color: Colors.black))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("123 Main Steet"),
                    Text("(415) 555-0198"),
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1.0, color: Colors.black),
                    left: BorderSide(width: 1.0, color: Colors.black),
                    right: BorderSide(width: 1.0, color: Colors.black),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Icon(Icons.accessibility),
                    IconButton(
                      color:
                          isAccesibilitySelected ? Colors.indigo : Colors.black,
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Únete a un club con otras personas"),
                          ),
                        );
                        isAccesibilitySelected = !isAccesibilitySelected;
                        setState(() {});
                      },
                      icon: const Icon(Icons.accessibility),
                    ),
                    // Icon(Icons.timer),
                    IconButton(
                      color: isTimerSelected  ? Colors.indigo : Colors.black,
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                "Cuenta regresiva para el evento: 31 días"),
                          ),
                        );
                        isTimerSelected = !isTimerSelected;
                        setState(() {});
                      },
                      icon: const Icon(Icons.timer),
                    ),
                    // Icon(Icons.phone_android),
                    IconButton(
                      color: isAndroidSelected? Colors.indigo : Colors.black,
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Llama al número 4155550198"),
                          ),
                        );
                        isAndroidSelected = !isAndroidSelected;
                        setState(() {});
                      },
                      icon: const Icon(Icons.phone_android),
                    ),
                    // Icon(Icons.phone_iphone),
                    IconButton(
                      color: isIosSelected? Colors.indigo : Colors.black,
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Llama al celular 3317865113"),
                          ),
                        );
                        isIosSelected =!isIosSelected;
                        setState(() {});
                      },
                      icon: const Icon(Icons.phone_iphone),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
