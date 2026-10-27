import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TurnCount(),
    );
  }
}

class TurnCount extends StatefulWidget {
  const TurnCount({super.key});

  @override
  State<TurnCount> createState() => _TurnCountState();
}

class _TurnCountState extends State<TurnCount> {
  final TextEditingController documentController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  int turn = 1;
  List nameList = [];
  String message = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TURNOS')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: documentController,
              decoration: const InputDecoration(labelText: 'Documento'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Nombre'),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (turn <= 30) {
                      setState(() {
                        nameList.add({
                          'nombre': nameController.text,
                          'turno': turn,
                        });
                        message = '${nameController.text} tu turno es el $turn';
                        turn++;
                      });
                      print(nameList);
                      documentController.clear();
                      nameController.clear();
                    } else {
                      setState(() {
                        message = 'No se permiten más turnos (Máximo 30)';
                      });
                      print('Límite de turnos alcanzado.');
                    }
                  },
                  child: const Text('Generar Turno'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      turn = 1;
                      nameList.clear();
                      message = '';
                      documentController.clear();
                      nameController.clear();
                    });
                    print('Turnos reseteados: $nameList');
                  },
                  child: const Text('Resetear'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(message, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
