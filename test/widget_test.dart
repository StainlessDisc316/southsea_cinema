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
}
