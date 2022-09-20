import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemToken extends StatelessWidget {
  final tokenObj;
  const ItemToken({super.key, this.tokenObj});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const FaIcon(FontAwesomeIcons.ethereum),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("${tokenObj["string"]}"),
            Text("\$${tokenObj["value"]}")
          ],
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("${tokenObj["company"]}"),
            Text("\$${tokenObj["money"]}")
          ],
        ),
      ),
    );
  }
}
