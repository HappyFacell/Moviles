import 'package:flutter/material.dart';

class Donativos extends StatefulWidget {
  final double? donativos;
  final double totalPaypal;
  final double totalTarjetas;

  const Donativos({
    Key? key,
    @required this.donativos,
    required this.totalPaypal,
    required this.totalTarjetas,
  }) : super(key: key);

  @override
  _DonativosState createState() => _DonativosState();
}

class _DonativosState extends State<Donativos> {
  @override
  Widget build(BuildContext context) {
    // print("Donativos obtenidos: ${widget.donativos}");
    return Scaffold(
      appBar: AppBar(title: const Text("Donativos obtenidos")),
      body: Container(
        child: Column(
          children: [
            Text("Paypal: ${widget.totalPaypal}"),
            Text("Tarjeta de credito: ${widget.totalTarjetas}"),
            Text("Total: ${widget.donativos}"),
          ],
        ),
      ),
    );
  }
}
