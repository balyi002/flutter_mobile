import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: true, home: Calculator());
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final TextEditingController number1Controller = TextEditingController();
  final TextEditingController number2Controller = TextEditingController();
  final TextEditingController number3Controller = TextEditingController();

  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conversor de Moneda'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: number1Controller,
              keyboardType: TextInputType.numberWithOptions(),
              decoration: InputDecoration(labelText: 'Pesos Colombianos'),
            ),
            SizedBox(height: 10),

            TextField(
              controller: number2Controller,
              keyboardType: TextInputType.numberWithOptions(),
              decoration: InputDecoration(labelText: 'Dolares'),
            ),
            SizedBox(height: 10),

            TextField(
              controller: number3Controller,
              keyboardType: TextInputType.numberWithOptions(),
              decoration: InputDecoration(labelText: 'Euro'),
            ),
            SizedBox(height: 10),

            Text('Resultado: $result'),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                double pesos = double.parse(number1Controller.text);

                // Tasas de cambio de referencia (puedes ajustar el valor según la tasa del día)
                double tasaDolar = 3100;
                double tasaEuro = 3500;

                double dolares = pesos / tasaDolar;
                double euros = pesos / tasaEuro;

                setState(() {
                  number2Controller.text = dolares.toStringAsFixed(2);
                  number3Controller.text = euros.toStringAsFixed(2);
                  result = 'Dólares: \$${dolares.toStringAsFixed(2)} | Euros: €${euros.toStringAsFixed(2)}';
                });
                print(result);
              },
              child: Text('CONVERTIR'),
            ),
          ],
        ),
      ),
    );
  }
}
