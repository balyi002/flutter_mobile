import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menú Prigma',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _moduloActual = 'Inicio';

  void _seleccionarModulo(String modulo) {
    setState(() {
      _moduloActual = modulo;
    });
    Navigator.pop(context); // Cierra el drawer al seleccionar
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_moduloActual),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              child: const Text(
                'Menú Principal',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.inventory_2_outlined),
              title: const Text('Productos'),
              onTap: () => _seleccionarModulo('Productos'),
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart_outlined),
              title: const Text('Compras'),
              onTap: () => _seleccionarModulo('Compras'),
            ),
            ListTile(
              leading: const Icon(Icons.people_outline),
              title: const Text('Empleados'),
              onTap: () => _seleccionarModulo('Empleados'),
            ),
            ListTile(
              leading: const Icon(Icons.calendar_today_outlined),
              title: const Text('Agenda'),
              onTap: () => _seleccionarModulo('Agenda'),
            ),
            ListTile(
              leading: const Icon(Icons.point_of_sale_outlined),
              title: const Text('Ventas'),
              onTap: () => _seleccionarModulo('Ventas'),
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(
          'Módulo actual: $_moduloActual',
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
