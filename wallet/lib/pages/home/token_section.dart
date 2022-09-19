import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet/pages/home/item_token.dart';
import 'package:wallet/providers/token_provider.dart';


class TokenSection extends StatelessWidget {
  const TokenSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text('Your tokens'),
            Text('Make Changes'),
          ],
        ),
        Expanded(
          child: ListView.builder(
            itemCount: context.watch<TokensProvider>().getTokenList.length,
            itemBuilder: (BuildContext context, int index) {
              return ItemToken(tokenObj: context.read<TokensProvider>().getTokenList[index]);
            },
          ),
        )
      ],
    );
  }
}
