import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';

void main() {
  group('Movie model tests', () {
    test('Assigns Movie constructor values and formats whole-pound price', () {
      const movie = Movie(
        id: 'test',
        title: 'Test Movie',
        yearReleased: '2026',
        rating: 'PG',
        room: 'Southsea Cinema Room',
        screeningDate: '2026-01-01',
        screeningTime: '18:00',
        synopsis: 'A test movie synopsis.',
        adultPrice: 5.0,
        imagePath: 'assets/images/test.jpg',
      );

      expect(movie.id, 'test');
      expect(movie.title, 'Test Movie');
      expect(movie.yearReleased, '2026');
      expect(movie.rating, 'PG');
      expect(movie.room, 'Southsea Cinema Room');
      expect(movie.screeningDate, '2026-01-01');
      expect(movie.screeningTime, '18:00');
      expect(movie.synopsis, 'A test movie synopsis.');
      expect(movie.adultPrice, 5.0);
      expect(movie.imagePath, 'assets/images/test.jpg');
      expect(movie.formattedPrice, '£5.00');
    });

    test('Accurately formats decimal price', () {
      const movie = Movie(
        id: 'test2',
        title: 'Test Movie 2',
        yearReleased: '2026',
        rating: 'PG',
        room: 'Southsea Cinema Room',
        screeningDate: '2026-01-01',
        screeningTime: '18:00',
        synopsis: 'A test movie synopsis.',
        adultPrice: 5.5,
        imagePath: 'assets/images/test.jpg',
      );

      expect(movie.formattedPrice, '£5.50');
    });
  });
}
