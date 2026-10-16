import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/repositories/movie_repository.dart';

void main() {
  group('MovieRepository unit tests', () {
    test('getMovies returns two movies', () {
      final MovieRepository repository = MovieRepository();
      final List<Movie> movies = repository.getMovies();

      expect(movies.length, 2);
    });

    test('getMovies returns correct movie data', () {
      final MovieRepository repository = MovieRepository();
      final List<Movie> movies = repository.getMovies();

      final Movie firstMovie = movies[0];
      expect(firstMovie.id, 'dark-knight-rises');
      expect(firstMovie.title, 'THE DARK KNIGHT RISES');
      expect(firstMovie.yearReleased, '2012');
      expect(firstMovie.rating, '12A');
      expect(firstMovie.room, 'Southsea Cinema Room');
      expect(firstMovie.screeningDate, 'Friday 16 Oct 2026');
      expect(firstMovie.screeningTime, '15:00');
      expect(firstMovie.synopsis,
          'Bane, an imposing terrorist, attacks Gotham City and disrupts '
          'its eight-year-long period of peace. This forces Bruce Wayne to '
          'come out of hiding and don the cape and cowl of Batman again.');
      expect(firstMovie.adultPrice, 7.50);
      expect(firstMovie.imagePath, isNotEmpty);

      final Movie secondMovie = movies[1];
      expect(secondMovie.id, 'the-matrix');
      expect(secondMovie.title, 'THE MATRIX');
      expect(secondMovie.yearReleased, '1999');
      expect(secondMovie.rating, '15');
      expect(secondMovie.room, 'Southsea Cinema Room');
      expect(secondMovie.screeningDate, 'Friday 16 Oct 2026');
      expect(secondMovie.screeningTime, '18:00');
      expect(secondMovie.synopsis,
          'A computer hacker discovers that his life is nothing more than an '
          'elaborate simulation run by an evil AI.');
      expect(secondMovie.adultPrice, 7.50);
      expect(secondMovie.imagePath, isNotEmpty);
    });
  });

  test('getMovieById returns matching movie when movie exists', () {
    final MovieRepository repository = MovieRepository();
    final Movie? movie = repository.getMovieById('dark-knight-rises');

    expect(movie, isNotNull);
    expect(movie?.title, 'THE DARK KNIGHT RISES');
  });

  test('getMovieById returns null when id does not exist', () {
    final MovieRepository repository = MovieRepository();
    final Movie? movie = repository.getMovieById('invalid-id');

    expect(movie, isNull);
  });
}

