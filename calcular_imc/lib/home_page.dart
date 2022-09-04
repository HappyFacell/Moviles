import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isMaleSelected = true;
  bool isFemaleSelected = false;
  var alturaController = TextEditingController();
  var pesoController = TextEditingController();
  final String _mj = ''' 
Tabla del IMC para mujeres
Edad      IMC ideal 
16-17     19-24 
18-18       19-24   
19-24     19-24 
25-34     20-25 
35-44     21-26 
45-54     22-27 
55-64     23-28 
65-90     25-30
  ''';
  final String _hb = ''' 
Tabla del IMC para hombres
Edad      IMC ideal 
16-16       19-24   
17-17       20-25   
18-18       20-25   
19-24     21-26 
25-34     22-27 
35-54     23-38 
55-64     24-29 
65-90     25-30
  ''';

  void _resetAll() {
    alturaController.clear();
    pesoController.clear();
    isMaleSelected = false;
    isFemaleSelected = false;
    setState(() {});
  }

  double _calcularImc() {
    double altura = double.parse(alturaController.text);
    double peso = double.parse(pesoController.text);

    return peso / (altura * altura);
  }

  void _dialogo(double imc) {
    if (isMaleSelected) {
      // dialogo 1
      showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            title: Text("Tu IMC: $imc"),
            content: Text(_hb),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Aceptar"),
              )
            ],
          );
        }),
      );
    } else {
      // dialogo 2
      showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            title: Text("Tu IMC: $imc"),
            content: Text(_mj),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Aceptar"),
              )
            ],
          );
        }),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calcular IMC'),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            onPressed: () {
              _resetAll();
            },
            icon: const Icon(Icons.delete),
            tooltip: 'Borrar todo',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: ListView(
          children: [
            const Text(
              "Ingrese datos para calcular IMC",
              textAlign: TextAlign.center,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  color: isMaleSelected ? Colors.indigo : Colors.grey,
                  onPressed: () {
                    isMaleSelected = !isMaleSelected;
                    isFemaleSelected = !isFemaleSelected;
                    setState(() {});
                  },
                  icon: const Icon(Icons.male),
                ),
                IconButton(
                  color: isFemaleSelected ? Colors.indigo : Colors.grey,
                  onPressed: () {
                    isFemaleSelected = !isFemaleSelected;
                    isMaleSelected = !isMaleSelected;
                    setState(() {});
                  },
                  icon: const Icon(Icons.female),
                ),
              ],
            ),
            const SizedBox(height: 24),
            TextField(
              controller: alturaController,
              keyboardType: TextInputType.datetime,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.square_foot),
                label: Text("Ingresar altura en metros"),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: pesoController,
              keyboardType: TextInputType.datetime,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.line_weight),
                label: Text("Ingresar peso en KG"),
                border: OutlineInputBorder(),
              ),
            ),
            TextButton(
              onPressed: () {
                double imc = _calcularImc();
                _dialogo(imc);
              },
              child: const Text("Calcular"),
            ),
          ],
        ),
      ),
    );
  }
}
