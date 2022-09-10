import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // TODO: completar todo lo necesario
  var tipController = TextEditingController();
  double totalTip = 0.00;

  int? currentRadio;
  var radioGroup = {
    0: "Amazing 20%",
    1: "Good 18%",
    2: "Okay 15%",
  };

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
                  labelText: 'Service',
                ),
              ),
            ),
          ),
          const ListTile(
            leading: Icon(Icons.dinner_dining),
            title: Text("How was the service?"),
          ),
          Column(
            mainAxisSize: MainAxisSize.min, children: radioGroupGenerator(),
// const Text("Aqui agregar el GRUPO de radio buttons"),
          ),
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
            "Tip amount: \$${(totalTip).toStringAsFixed(2)}",
            textAlign: TextAlign.end,
          ),
        ],
      ),
    );
  }

  double _tipCalculation() {
    // TODO: completar
    double totalTip = double.parse(tipController.text);
    if (currentRadio == 0){
      return totalTip = totalTip * 0.2;
    }
    else if (currentRadio == 1){
      return totalTip = totalTip * 0.18;
    }
    else if (currentRadio == 2){
      return totalTip = totalTip * 0.15;
    }
    else{
      return 0.00;
    }
  }

  radioGroupGenerator() {
    return radioGroup.entries
        .map(
          (radioElement) => ListTile(
            leading: Radio(
              value: radioElement.key,
              groupValue: currentRadio,
              onChanged: (int? selected) {
                currentRadio = selected;
                setState(() {});
              },
            ),
            title: Text(radioElement.value),
          ),
        )
        .toList();
  }
}
