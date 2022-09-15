import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:requests_provider/providers/users_data_provider.dart';

class HomePage2 extends StatelessWidget {
  const HomePage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
          // actions: [
          //   IconButton(
          //     onPressed: () {
          //       context.read<UserDataProvider>().getUsers();
          //     },
          //     icon: Icon(Icons.refresh),
          //   ),
          // ],
        ),
        body: ListView.builder(
          itemCount: context.watch<UserDataProvider>().getUsersList.length,
          itemBuilder: (BuildContext context, int index) {
            var _itemUser = context.read<UserDataProvider>().getUsersList[index];
            return ListTile(
              title: Text(_itemUser["email"]),
            );
          },
        ));
  }
}
