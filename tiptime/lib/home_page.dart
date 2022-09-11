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
  bool roundTipUp = false;

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
          ),
          ListTile(
            leading: const Icon(Icons.credit_card),
            title: Row(
              children: [
                const Text("Round up tip"),
                const Spacer(),
                Switch(
                  value: roundTipUp,
                  onChanged: (newvalue) {
                    setState(
                      () {
                        roundTipUp = newvalue;
                      },
                    );
                  },
                )
              ],
            ),
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
    double totalTip = double.parse(tipController.text);
    if (currentRadio == 0) {
      totalTip = totalTip * 0.2;
      roundTipUp == true ? totalTip = totalTip.roundToDouble() : totalTip = totalTip; 
      return totalTip;
    } else if (currentRadio == 1) {
      totalTip = totalTip * 0.18;
      roundTipUp == true ? totalTip = totalTip.roundToDouble() : totalTip = totalTip; 
      return totalTip;
    } else if (currentRadio == 2) {
      totalTip = totalTip * 0.15;
      roundTipUp == true ? totalTip = totalTip.roundToDouble() : totalTip = totalTip; 
      return totalTip;
    } else {
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
