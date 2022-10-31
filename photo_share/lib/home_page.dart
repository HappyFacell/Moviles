import 'package:flutter/material.dart';

import 'content/agregar/agregar.dart';
import 'content/espera/en_espera.dart';
import 'content/foru/fotos_for_you.dart';
import 'content/mis_fotos/mi_contenido.dart';


class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPageIndex = 0;
  final _pagesNameList = [
    "For you",
    "Crear nuevo",
    "En espera",
    "Mi contenido",
  ];
  final _pagesList = [
    FotosForYou(),
    Agregar(),
    EnEspera(),
    MiContenido(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${_pagesNameList[_currentPageIndex]}"),
      ),
      body: IndexedStack(
        index: _currentPageIndex,
        children: _pagesList,
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
            icon: Icon(Icons.view_carousel),
            label: _pagesNameList[0],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_camera),
            label: _pagesNameList[1],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.query_builder),
            label: _pagesNameList[2],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mobile_friendly),
            label: _pagesNameList[3],
          ),
        ],
      ),
    );
  }
}
