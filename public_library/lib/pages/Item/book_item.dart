import 'package:flutter/material.dart';
import 'package:public_library/pages/Result/book_result.dart';

class BooksItems extends StatelessWidget {
  final dynamic books;
  const BooksItems({super.key, this.books});

  @override
  Widget build(BuildContext context) {
    print('LLegaron: $books'); 
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => BookResult(
                  data: books,
                ),
              ),
            );
          },
          child: Image.network(
            "${books["volumeInfo"]["imageLinks"] != null ? books["volumeInfo"]["imageLinks"]["thumbnail"] : "https://library.msu.ac.zw/img/nocover.png"}",
            width: 150,
            height: 150,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4.0, left: 12, right: 12),
          child: Text(
            "${books["volumeInfo"]["title"] ?? "Title not available"}",
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
