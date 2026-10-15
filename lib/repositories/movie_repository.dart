import 'package:southsea_cinema/models/movie.dart';

class MovieRepository {
  List<Movie> getMovies() {
    return const [
      Movie(
        id: 'dark-knight-rises',
        title: 'THE DARK KNIGHT RISES ',
        yearReleased: '2012',
        rating: '12A',
        room: 'Southsea Cinema Room',
        screeningDate: 'Friday 16 Oct 2026',
        screeningTime: '15:00',
        screeningEndTime: '- ends at 17:45',
        synopsis:
            'Bane, an imposing terrorist, attacks Gotham City and disrupts '
            'its eight-year-long period of peace. This forces Bruce Wayne to '
            'come out of hiding and don the cape and cowl of Batman again.',
        adultPrice: 7.50,
        imagePath: 'assets/images/dknight_poster2.jpg',
      ),
      Movie(
        id: 'the-matrix',
        title: 'THE MATRIX',
        yearReleased: '1999',
        rating: '15',
        room: 'Southsea Cinema Room',
        screeningDate: 'Friday 16 Oct 2026',
        screeningTime: '18:00',
        screeningEndTime: '- ends at 20:16',
        synopsis:
            'A computer hacker discovers that his life is nothing more than '
            'an elaborate simulation run by an evil AI.',
        adultPrice: 7.50,
        imagePath: 'assets/images/matrix_poster.jpg',
      ),
    ];
  }
}
