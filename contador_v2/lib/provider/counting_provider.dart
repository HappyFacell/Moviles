import 'package:flutter/cupertino.dart';

class Counting with ChangeNotifier {
  int _count = 0;

  int get getCount => _count;

  void addCount() {
    _count += 1;
    notifyListeners();
  }

  void minusCount() {
    if (_count > 0) {
      _count -= 1;
    }
    notifyListeners();
  }

  void resetCount(){
    _count = 0;
    notifyListeners();
  }
}
