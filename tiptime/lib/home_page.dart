import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // TODO: completar todo lo necesario
  var tipController = TextEditingController();
  double totalTip = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tip time'),
        backgroundColor: Colors.green[400],
      ),
      body: ListView(
        children: [
          const SizedBox(height: 14),
          ListTile(
            leading: const Icon(Icons.room_service),
            title: Padding(
              padding: const EdgeInsets.only(right: 24),
              child: TextField(
                controller: tipController,
                keyboardType: TextInputType.datetime,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'User Name',
                ),
              ),
            ),
          ),
          const ListTile(
            leading: Icon(Icons.dinner_dining),
            title: Text("How was the service?"),
          ),
          const Text("Aqui agregar el GRUPO de radio buttons"),
          const ListTile(
            leading: Icon(Icons.credit_card),
            title: Text("Round up tip"),
          ),
          MaterialButton(
            onPressed: () {
              totalTip = _tipCalculation();
              setState(() {});
            },
            color: Colors.green[400],
            child: const Text(
              'CALCULATE',
              style: TextStyle(color: Colors.white),
            ),
          ),
          Text(
            "Tip amount: $totalTip",
            textAlign: TextAlign.end,
          ),
        ],
      ),
    );
  }

  double _tipCalculation() {
    double totalTip = double.parse(tipController.text);
    totalTip = double.parse((totalTip*0.22).toStringAsFixed(3));
    return totalTip;
  }
  // TODO: completar
}
