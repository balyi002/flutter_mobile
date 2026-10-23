import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../ios/lib/main.dart';

void main() {
  testWidgets('Carga la pagina de Hoja de Vida', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Hoja de Vida'), findsOneWidget);
    expect(find.byIcon(Icons.person), findsOneWidget);
    expect(find.text('Información personal'), findsOneWidget);
    expect(find.text('Información Académica'), findsOneWidget);
    expect(find.text('Experiencia Laboral'), findsOneWidget);
  });
}
