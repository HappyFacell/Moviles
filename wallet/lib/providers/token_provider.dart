import 'package:flutter/cupertino.dart';

class TokensProvider with ChangeNotifier {
  List<dynamic> _tokenList = [
    {
      "string": "0xff234..56a",
      "value": "322 ETH",
      'company': "Binance",
      "money": "200k"
    },
  ];

  List<dynamic> get getTokenList => _tokenList;

  void addNewToken(dynamic tokenObj) {
    _tokenList.add(tokenObj);
    notifyListeners();
  }
}
