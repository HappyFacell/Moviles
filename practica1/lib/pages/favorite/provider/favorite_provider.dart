import 'package:flutter/cupertino.dart';

class FavoriteProvider with ChangeNotifier {
  final List<dynamic> _favorite = [];

  List<dynamic> get getFavorite => _favorite;

  void addFavorite(dynamic song) {
    _favorite.add(song);
    notifyListeners();
  }

  void removeFavorite(dynamic song) {
    _favorite.remove(song);
    notifyListeners();
  }
}
