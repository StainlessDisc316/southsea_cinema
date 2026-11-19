import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/basket_item.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/repositories/basket_repository.dart';

//safety

const Movie testMovie1 = Movie( 
  id: 'basket_test_movie',
  title: 'Basket Test Movie',
  yearReleased: '2026',
  rating: 'PG',
  room: 'Southsea Cinema Room',
  screeningDate: '2026-01-01',
  screeningTime: '18:00',
  synopsis: 'A test movie synopsis.',
  adultPrice: 5.0,
  imagePath: 'assets/images/test.jpg',
);

const Movie testMovie2 = Movie(
  id: 'basket_test_movie2',
  title: 'Basket Test Movie 2',
  yearReleased: '2026',
  rating: '15',
  room: 'Southsea Cinema Room',
  screeningDate: '2026-01-01',
  screeningTime: '21:00',
  synopsis: 'Another test movie synopsis.',
  adultPrice: 10.00,
  imagePath: 'assets/images/test.jpg',
);

void main() {
  setUp(() {
    BasketRepository.instance.clear();
  });

  group('BasketRepository tests', () {
    test('starts with empty basket and zero totals', () {
      final BasketRepository basket = BasketRepository.instance;
      expect(basket.getBasketItems(), isEmpty);
      expect(basket.totalTicketCount, 0);
      expect(basket.getTotal(), 0.0);
    });

    test('adds items and calculates total', () {
      final BasketRepository basket = BasketRepository.instance;
      const BasketItem item1 = BasketItem(
        movie: testMovie1,
        ticketQuantity: 2,
      );
      const BasketItem item2 = BasketItem(
        movie: testMovie2,
        ticketQuantity: 1,
      );

      basket.addItem(item1);
      basket.addItem(item2);

      expect(basket.getBasketItems(), [item1, item2]);
      expect(basket.totalTicketCount, 3);
      expect(basket.getTotal(), 20.0);
    });

    test('removes items correctly', () {
      final BasketRepository basket = BasketRepository.instance;
      const BasketItem item = BasketItem(
        movie: testMovie1,
        ticketQuantity: 1,
      );
      basket.addItem(item);
      expect(basket.getBasketItems(), [item]);

      basket.removeItem(0);
      expect(basket.getBasketItems(), isEmpty);
      expect(basket.getTotal(), 0.0);
    });

    test('clears all items', () {
      final basket = BasketRepository.instance;

      basket.addItem(
        const BasketItem(movie: testMovie1, ticketQuantity: 2),
      );

      basket.clear();

      expect(basket.getBasketItems(), isEmpty);
      expect(basket.totalTicketCount, 0);
      expect(basket.getTotal(), 0.0);
    });
  });
}
