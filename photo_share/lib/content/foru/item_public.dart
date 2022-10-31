import 'package:flutter/material.dart';

class ItemPublic extends StatefulWidget {
  final Map<String, dynamic> publicFData;
  ItemPublic({super.key, required this.publicFData});

  @override
  State<ItemPublic> createState() => _ItemPublicState();
}

class _ItemPublicState extends State<ItemPublic> {
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.network(
              "${widget.publicFData["picture"]}",
              fit: BoxFit.cover,
            ),
          ),
          ListTile(
            leading: CircleAvatar(
              child: Text("${widget.publicFData["title"].toString()[0]}"),
            ),
            title: Text("${widget.publicFData["title"]}"),
            subtitle: Text("${widget.publicFData["publicshedAt"].toDate()}"),
            trailing: Wrap(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.star),
                  tooltip: "Stars: ${widget.publicFData["stars"]}",
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.share),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
