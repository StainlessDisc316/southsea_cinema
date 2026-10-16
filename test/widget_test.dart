import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/main.dart';

void main() {
  group('App smoke tests', () {
    testWidgets('HomeView widgets display target content',
        (WidgetTester tester) async {
      await tester.pumpWidget(const SouthseaCinemaApp());

      expect(find.text('Southsea Cinema & Arts Centre'), findsOneWidget);
      expect(find.text('THE MATRIX'), findsOneWidget);
      expect(find.text('THE DARK KNIGHT RISES'), findsOneWidget);
      expect(find.text('BOOK NOW'), findsNWidgets(2));
    });
  });

  testWidgets('Booking button navigates to the correct movie details page',
      (WidgetTester tester) async {
    await tester.pumpWidget(const SouthseaCinemaApp());

    await tester.tap(find.text('BOOK NOW').first);
    await tester.pumpAndSettle();
    await tester.tap(find.text('0').last);
    await tester.pumpAndSettle();
    await tester.tap(find.text('1').last);
    await tester.pumpAndSettle();
    await tester.tap(find.text('Add to order'));
    await tester.pumpAndSettle();

    expect(find.text('THE DARK KNIGHT RISES (2012) (12A)'), findsOneWidget);
    expect(find.text('1 ticket(s) added to order!'), findsOneWidget);
  });
}
