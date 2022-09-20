import 'package:flutter/material.dart';
import 'package:wallet/pages/home/balance_section.dart';
import 'package:wallet/pages/home/token_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: Stack(children: [
        Container(
          color: Colors.green[900],
        ),
        Column(
          children: [
            BalanceSection(),
            Divider(),
            Expanded(child: TokenSection())
          ],
        )
      ]),
    );
  }
}
