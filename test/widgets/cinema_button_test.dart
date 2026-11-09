import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/widgets/cinema_button.dart';

void main() {
  testWidgets('CinemaButton renders label', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CinemaButton(
            label: 'BOOK NOW',
            onPressed: () {},
          ),
        ),
      ),
    );

    expect(find.text('BOOK NOW'), findsOneWidget);
  });

  testWidgets('CinemaButton invokes onPressed when tapped',
      (WidgetTester tester) async {
    bool wasPressed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CinemaButton(
            label: 'Add to order',
            onPressed: () {
              wasPressed = true;
            },
          ),
        ),
      ),
    );

    await tester.tap(find.text('Add to order'));
    await tester.pump();

    expect(wasPressed, isTrue);
  });
}