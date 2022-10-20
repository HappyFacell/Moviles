import 'package:flutter/material.dart';

import '../agregar/agregar.dart';
import '../contenido/mi_contenido.dart';
import '../espera/en_espera.dart';
import '../for_you/for_you.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _currentPageIndex = 0;
  final _pageNameList = [
    'agregar',
    'espera',
    'for_you',
    'contenido',
  ];
  final _pageList = [
    const Agregar(),
    const EnEspera(),
    const FotosForYou(),
    const MiContenido(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pageNameList[_currentPageIndex]),
      ),
      body: IndexedStack(
        index: _currentPageIndex,
        children: _pageList,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentPageIndex,
        onTap: (index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.view_carousel),
            label: _pageNameList[0],
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.photo_camera),
            label: _pageNameList[1],
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.query_builder),
            label: _pageNameList[2],
            
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.mobile_friendly),
            label: _pageNameList[3],
          ),
        ],
      ),
    );
  }
}
