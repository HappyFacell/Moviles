import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  var _tokencontroller = TextEditingController(text: UniqueKey().toString());
  var _valueController = TextEditingController(text: UniqueKey().toString());
  var _companyController = TextEditingController(text: UniqueKey().toString());
  var _moneyController = TextEditingController(text: UniqueKey().toString());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar token'),
      ),
      body: Column(
        children: [
          _editableTextInput(_tokencontroller, "Token string"),
          _editableTextInput(_valueController, "Token string"),
          _editableTextInput(_companyController, "Token string"),
          _editableTextInput(_moneyController, "Token string"),
        ],
      ),
    );
  }

  TextField _editableTextInput(TextEditingController controller, String label) {
    return TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            label: Text(label),
          ),
        );
  }
}
