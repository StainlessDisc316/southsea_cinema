import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';
import 'package:southsea_cinema/widgets/movie_card.dart';
import 'package:southsea_cinema/repositories/movie_repository.dart';

class MovieCardPreview extends StatelessWidget {
  const MovieCardPreview({super.key});

  @override
  Widget build(BuildContext context) {
    final matrix = MovieRepository()
        .getMovies()
        .firstWhere((movie) => movie.id == 'the-matrix');
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Preview',
          style: cinemaHeaderStyle,
        ),
        backgroundColor: cinemaSurface,
        iconTheme: const IconThemeData(color: cinemaBrand),
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 16),
        children: [
          MovieCard(movie: matrix),
        ],
      ),
    );
    
  }
}