import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/basket_item.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/repositories/basket_repository.dart';
import 'package:southsea_cinema/views/basket_view.dart';

const movie = Movie(
  id: 'bv_test_movie',
  title: 'Basket View Test Movie',
  yearReleased: '2026',
  rating: 'PG',
  room: 'Southsea Cinema Room',
  screeningDate: '2026-01-01',
  screeningTime: '10:00',
  synopsis: 'A test movie synopsis.',
  adultPrice: 5.0,
  imagePath: 'assets/images/test.jpg',
);

void main() {
  setUp(() {
    BasketRepository.instance.clear();
  });


  testWidgets('BasketView displays empty basket when no items are added', (
    WidgetTester tester,
   ) async {
    await tester.pumpWidget(
      const MaterialApp(home: BasketView()),
    );

    expect(find.text('Your basket is empty'), findsOneWidget);
    expect(find.text('BUY TICKETS'), findsNothing);
  });

  testWidgets('BasketView renders items and removes them', (tester) async {
    const item = BasketItem(
      movie: movie,
      ticketQuantity: 2,
    );

    BasketRepository.instance.addItem(item);

    await tester.pumpWidget(
      const MaterialApp(home: BasketView()),
    );

    expect(find.text('MY ORDER'), findsOneWidget);
    expect(find.text('2 Tickets'), findsOneWidget);
    expect(find.textContaining('Basket View Test Movie'), findsOneWidget);
    expect(find.text('£10.00'), findsWidgets);
    expect(find.text('£4.00'), findsOneWidget);
    expect(find.text('£14.00'), findsOneWidget);
    expect(find.text('BUY TICKETS'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.delete_outline));
    await tester.pump();

    expect(find.text('Your basket is empty'), findsOneWidget);
  });
}