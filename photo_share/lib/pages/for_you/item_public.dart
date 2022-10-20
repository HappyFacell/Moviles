import 'package:flutter/material.dart';

class PublicItem extends StatefulWidget {
  final Map<String, dynamic> publicData;
  const PublicItem({super.key, required this.publicData});

  @override
  State<PublicItem> createState() => _PublicItemState();
}

class _PublicItemState extends State<PublicItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.network(
              widget.publicData["picture"],
              fit: BoxFit.cover,
            ),
          ),
          ListTile(
            leading: CircleAvatar(
              child: Text(
                widget.publicData['title'].toString()[0],
              ),
            ),
            title: Text(widget.publicData['title'].toString()),
            subtitle: Text(widget.publicData['publicshedAt'].toString()),
            trailing: Wrap(children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.star),
                tooltip: "stars: ${widget.publicData['stars']}",
              )
            ]),
          ),
        ],
      ),
    );
  }
}
