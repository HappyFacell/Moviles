import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';

class BookResult extends StatefulWidget {
  final dynamic data;
  const BookResult({super.key, this.data});

  @override
  State<BookResult> createState() => _BookResultState();
}

class _BookResultState extends State<BookResult> {
  bool titleShown = false;
  bool descShown = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles de libro'),
        actions: [
          IconButton(
            icon: const Icon(Icons.public),
            tooltip: 'Visitar página',
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.share),
            tooltip: 'Compartir contenido',
            onPressed: () {
              shareContent(context, widget.data);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.network(
                "${widget.data["volumeInfo"]["imageLinks"] != null ? widget.data["volumeInfo"]["imageLinks"]["thumbnail"] : "https://library.msu.ac.zw/img/nocover.png"}",
                fit: BoxFit.fitHeight,
                height: 350,
              ),
              GestureDetector(
                onTap: () {
                  titleShown = !titleShown;
                  setState(() {});
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                  child: Text(
                    "${widget.data["volumeInfo"]["title"] ?? "Title not available"}",
                    style: const TextStyle(fontSize: 32),
                    overflow: titleShown ? null : TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Text(
                  "${widget.data["volumeInfo"]["publishedDate"] ?? "Date not available"}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Text(
                  "Paginas: ${widget.data["volumeInfo"]["pageCount"] ?? "Page number not available"}",
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              GestureDetector(
                onTap: () {
                  descShown = !descShown;
                  setState(() {});
                },
                child: Text(
                  "${widget.data["volumeInfo"]["description"] ?? "Description not available"}",
                  maxLines: descShown ? 30 : 6,
                  overflow: descShown ? null : TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void shareContent(BuildContext context, dynamic bookData) async {
    await FlutterShare.share(
        title: "${widget.data["volumeInfo"]["title"] ?? "Title not available"}",
        text:
            'Libro: ${widget.data["volumeInfo"]["title"] ?? "Title not available"}\nPaginas: ${widget.data["volumeInfo"]["pageCount"] ?? "Page number not available"}',
        linkUrl: "${widget.data["selfLink"]}",
        chooserTitle: 'Elige como compartir tu libro');
  }
}
