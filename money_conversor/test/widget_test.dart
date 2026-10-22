// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:money_conversor/main.dart';

void main() {
  testWidgets('Conversor test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Enter pesos
    await tester.enterText(find.widgetWithText(TextField, 'Pesos Colombianos'), '35000');
    await tester.tap(find.text('CONVERTIR'));
    await tester.pump();

    // Check values
    final dolaresField = tester.widget<TextField>(find.widgetWithText(TextField, 'Dolares'));
    final euroField = tester.widget<TextField>(find.widgetWithText(TextField, 'Euro'));

    print('Dolares field text: ${dolaresField.controller?.text}');
    print('Euro field text: ${euroField.controller?.text}');

    expect(dolaresField.controller?.text, '11.29');
    expect(euroField.controller?.text, '10.00');
  });
}
