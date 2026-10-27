import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Menu Inferior',
      home: MenuInferior(),
    );
  }
}

class MenuInferior extends StatefulWidget {
  const MenuInferior({super.key});

  @override
  State<MenuInferior> createState() => _MenuInferiorState();
}

class _MenuInferiorState extends State<MenuInferior> {
  int indiceSeleccionado = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Al bajad mamad')),
      body: Center(child: Text('Bienvenido al Inicio')),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: indiceSeleccionado,

        onTap: (index) {
          setState(() {
            indiceSeleccionado = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.badge), label: 'Curriculum'),
          BottomNavigationBarItem(icon: Icon(Icons.badge), label: 'Curriculum'),
          BottomNavigationBarItem(icon: Icon(Icons.badge), label: 'Curriculum'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
