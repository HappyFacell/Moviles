import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: FutureBuilder(
        future: _getUsers(),
        builder: ((context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text("Ha ocurrido un error"),
            );
          } else if (snapshot.hasData) {
            var _usersList = snapshot.data as List;
            return ListView.builder(
              itemCount: _usersList.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text("${_usersList[index]["email"]}"),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }),
      ),
    );
  }

  Future<dynamic> _getUsers() async {
    var _usersEndpoint = "https://jsonplaceholder.typicode.com/users";

    try {
      var _response = await get(Uri.parse(_usersEndpoint));
      if (_response.statusCode == 200) {
        var _content = jsonDecode(_response.body);
        return _content;
      }
    } catch (e) {
      return -1;
    }
  }
}
