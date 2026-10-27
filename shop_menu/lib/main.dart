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
      title: 'Mi Negocio',
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

  // Lista con el contenido simple de cada sección
  final List<Widget> _paginas = const [
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.home, size: 70, color: Colors.blue),
          SizedBox(height: 10),
          Text('Sección: Inicio del Negocio', style: TextStyle(fontSize: 18)),
        ],
      ),
    ),
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.shopping_bag, size: 70, color: Colors.blue),
          SizedBox(height: 10),
          Text('Sección: Nuestros Productos', style: TextStyle(fontSize: 18)),
        ],
      ),
    ),
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.business, size: 70, color: Colors.blue),
          SizedBox(height: 10),
          Text('Sección: Sobre Nosotros', style: TextStyle(fontSize: 18)),
        ],
      ),
    ),
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.phone, size: 70, color: Colors.blue),
          SizedBox(height: 10),
          Text('Sección: Contacto y Ubicación', style: TextStyle(fontSize: 18)),
        ],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi Negocio Personal'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      // Cambia el contenido según el índice seleccionado
      body: _paginas[indiceSeleccionado],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indiceSeleccionado,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            indiceSeleccionado = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: 'Productos'),
          BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Nosotros'),
          BottomNavigationBarItem(icon: Icon(Icons.phone), label: 'Contacto'),
        ],
      ),
    );
  }
}
