import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        backgroundColor:Colors.grey[200],
          appBar: AppBar(
            title: const Text('Material App Bar'),
          ),
          body: Column(children: [
            Column(
              children: const [
                Text("Auto Status", style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),),
                Text(
                  "Let your close friends know what you're up to as you move about your day. Tap on any aut status to see when it will appear.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                ),
                Text("Learn more"),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(top: 50, bottom: 50),
              child: Column(
                children: [
                  Container(
                    height: 50,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Row(children: [
                          primaryBotton(Icons.phone_android, "Android"),
                          primaryBotton(Icons.phone_android, "Android"),
                          primaryBotton(Icons.phone_android, "Android"),
                          primaryBotton(Icons.phone_android, "Android"),
                          primaryBotton(Icons.phone_android, "Android"),
                          primaryBotton(Icons.phone_android, "Android"),
                          primaryBotton(Icons.phone_android, "Android"),
                          primaryBotton(Icons.phone_android, "Android"),
                          primaryBotton(Icons.phone_android, "Android"),
                        ]),
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Row(children: [
                          primaryBotton(Icons.phone_iphone_rounded, "Iphone"),
                          primaryBotton(Icons.phone_iphone_rounded, "Iphone"),
                          primaryBotton(Icons.phone_iphone_rounded, "Iphone"),
                          primaryBotton(Icons.phone_iphone_rounded, "Iphone"),
                          primaryBotton(Icons.phone_iphone_rounded, "Iphone"),
                          primaryBotton(Icons.phone_iphone_rounded, "Iphone"),
                          primaryBotton(Icons.phone_iphone_rounded, "Iphone"),
                          primaryBotton(Icons.phone_iphone_rounded, "Iphone"),
                          primaryBotton(Icons.phone_iphone_rounded, "Iphone"),
                        ]),
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Row(children: [
                          primaryBotton(Icons.help, "Help"),
                          primaryBotton(Icons.help, "Help"),
                          primaryBotton(Icons.help, "Help"),
                          primaryBotton(Icons.help, "Help"),
                          primaryBotton(Icons.help, "Help"),
                          primaryBotton(Icons.help, "Help"),
                          primaryBotton(Icons.help, "Help"),
                          primaryBotton(Icons.help, "Help"),
                          primaryBotton(Icons.help, "Help"),
                        ]),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(onPressed: () {}, color: Colors.white, child: const Text("Turn on"),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(onPressed: () {}, color: Colors.white, child: const Text("Skip"),),
              )
            ]),
          ])),
    );
  }

  Padding primaryBotton(IconData icon, String text) {
    return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FloatingActionButton.extended(
                      backgroundColor: Colors.white,
                      onPressed: () {},
                      icon: Icon(icon, color: Colors.black,),
                      label: Text(text, style: const TextStyle(color: Colors.black),),
                    ),
                  );
  }
}
