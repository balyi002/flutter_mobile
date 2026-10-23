import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CotizacionFacil',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const QuotationPage(),
    );
  }
}

class QuotationPage extends StatefulWidget {
  const QuotationPage({super.key});

  @override
  State<QuotationPage> createState() => _QuotationPageState();
}

class _QuotationPageState extends State<QuotationPage> {
  // Controladores de texto para los campos
  final TextEditingController productController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();

  // Variables para almacenar y mostrar los resultados
  String productName = '';
  int quantity = 0;
  double unitPrice = 0.0;
  double valorBruto = 0.0;
  double descuento = 0.0;
  double porcentajeDescuento = 0.0;
  double iva = 0.0;
  double total = 0.0;
  bool isCalculated = false;

  void calcularCotizacion() {
    String producto = productController.text.trim();
    double precio = double.tryParse(priceController.text) ?? 0.0;
    int cant = int.tryParse(quantityController.text) ?? 0;

    // Valor bruto
    double bruto = precio * cant;

    // Reglas de negocio para el descuento:
    // - 10% si la cantidad está entre 100 y 500
    // - 15% si la cantidad es superior a 500
    double pctDescuento = 0.0;
    if (cant >= 100 && cant <= 500) {
      pctDescuento = 0.10;
    } else if (cant > 500) {
      pctDescuento = 0.15;
    }

    double desc = bruto * pctDescuento;

    // Regla de negocio para el IVA:
    // - IVA del 19% aplicado al valor bruto
    double impuestoIva = bruto * 0.19;

    // Total final de la compra
    double totalFinal = bruto - desc + impuestoIva;

    setState(() {
      productName = producto.isEmpty ? 'Sin especificar' : producto;
      quantity = cant;
      unitPrice = precio;
      valorBruto = bruto;
      porcentajeDescuento = pctDescuento * 100;
      descuento = desc;
      iva = impuestoIva;
      total = totalFinal;
      isCalculated = true;
    });
  }

  @override
  void dispose() {
    productController.dispose();
    priceController.dispose();
    quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'CotizacionFacil',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              'Calcula el precio de tu compra',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal),
            ),
          ],
        ),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 1. Título y Card para Nombre del producto
            const Text(
              'Nombre del producto',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 4.0,
                ),
                child: TextField(
                  controller: productController,
                  decoration: const InputDecoration(
                    hintText: 'Ingrese el nombre del producto',
                    border: InputBorder.none,
                    icon: Icon(Icons.shopping_bag_outlined),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // 2. Título y Card para Precio unitario
            const Text(
              'Precio unitario',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 4.0,
                ),
                child: TextField(
                  controller: priceController,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  decoration: const InputDecoration(
                    hintText: '0.00',
                    prefixText: '\$ ',
                    border: InputBorder.none,
                    icon: Icon(Icons.attach_money),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // 3. Título y Card para Cantidad
            const Text(
              'Cantidad',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 4.0,
                ),
                child: TextField(
                  controller: quantityController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: '0',
                    border: InputBorder.none,
                    icon: Icon(Icons.format_list_numbered),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // 4. Botón Calcular cotización
            ElevatedButton(
              onPressed: calcularCotizacion,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Calcular cotización',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 24),

            // 5. Card con el Total de la compra y detalles
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              color: Colors.orange.shade50,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Total de la compra',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '\$ ${total.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const Divider(height: 24),
                    Text(
                      'Producto: ${productName.isEmpty ? '---' : productName}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Cantidad: $quantity',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    if (isCalculated) ...[
                      const SizedBox(height: 12),
                      Text(
                        'Valor bruto: \$ ${valorBruto.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                      Text(
                        'Descuento (${porcentajeDescuento.toStringAsFixed(0)}%): -\$ ${descuento.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.green,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'IVA (19% sobre valor bruto): +\$ ${iva.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
