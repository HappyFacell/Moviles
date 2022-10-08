import 'dart:convert';

import 'package:http/http.dart' as http;

class RequestBook {
  static final RequestBook requestBooks = RequestBook._internal();

  factory RequestBook() => requestBooks;

  RequestBook._internal();

  Future<dynamic> getLibrary(String bookTitle) async {
    dynamic bookList;
    final Uri uri = Uri.https(
      'www.googleapis.com',
      '/books/v1/volumes',
      {'q': bookTitle},
    );

    final http.Response response =
        await http.get(uri, headers: {'Content-Type': 'application/json'});

    if (response.statusCode != 200) {
      throw Exception();
    }

    bookList = jsonDecode(response.body);
    return bookList;
  }
}
