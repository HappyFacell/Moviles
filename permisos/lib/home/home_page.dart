import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:permisos/home/bloc/files_bloc.dart';

class HomepPage extends StatelessWidget {
  var _titleC = TextEditingController();

  HomepPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: ListView(
        children: [
          _itemSaveOrRead(
            "tempDirectory",
            "/data/user/0/com.app.package/cache",
            context,
          ),
          _itemSaveOrRead(
            "externalStorageDirectory",
            "/storage/emulated/0/Andriod/data/com.app.package/files",
            context,
          ),
        ],
      ),
    );
  }

  Widget _itemSaveOrRead(String title, String subtitle, BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      leading: IconButton(
        tooltip: "Guardar Archivo",
        onPressed: () {},
        icon: const Icon(FontAwesomeIcons.fileSignature),
      ),
      trailing: IconButton(
        tooltip: "Leer Archivo",
        onPressed: () {},
        icon: const Icon(FontAwesomeIcons.readme),
      ),
    );
  }
}
