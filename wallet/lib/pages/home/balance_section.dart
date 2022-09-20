import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wallet/pages/home/add_page.dart';

class BalanceSection extends StatelessWidget {
  const BalanceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Total balance'),
        ListTile(
          title: const Text('\$426.75'),
          trailing: FloatingActionButton.extended(
            icon: const FaIcon(FontAwesomeIcons.sackDollar),
            label: const Text('Add token'),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AddPage(),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
