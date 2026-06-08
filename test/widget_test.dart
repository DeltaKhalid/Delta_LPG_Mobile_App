import 'package:delta_lpg_product_sale/presentation/ui/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Registration screen builds', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: RegistrationScreen()));
    await tester.pump();

    expect(find.widgetWithText(ElevatedButton, 'Sign Up'), findsOneWidget);
    expect(find.text('Please fill in your details'), findsOneWidget);
  });
}
