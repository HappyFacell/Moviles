import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet/providers/token_provider.dart';

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
        title: Text("Agregar Token"),
      ),
      body: Column(
        children: [
          _editableTextInput(_tokencontroller, "Token string"),
          _editableTextInput(_valueController, "Value"),
          _editableTextInput(_companyController, "Company"),
          _editableTextInput(_moneyController, "Money"),
          ElevatedButton(
              onPressed: () {
                context.read<TokensProvider>().addNewToken({
                  "string": _tokencontroller.text,
                  "value": _valueController.text,
                  "company": _companyController.text,
                  "money": _moneyController.text
                });
              },
              child: const Text("Guardar"))
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
      controller: controller,
    );
  }
}
