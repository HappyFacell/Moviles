import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class UserDataProvider with ChangeNotifier {
  final _usersEndpoint = "https://jsonplaceholder.typicode.com/users";
  List<dynamic> _usersList = [];
  List<dynamic> get getUsersList => _usersList;
  


  Future<dynamic> getUsers() async {
    try {
      var _response = await get(Uri.parse(_usersEndpoint));
      if (_response.statusCode == 200) {
        var _content = jsonDecode(_response.body);
        _usersList = _content;
        notifyListeners();
      }
    } catch (e) {
      _usersList = [];
      notifyListeners();
    }
  }
}
