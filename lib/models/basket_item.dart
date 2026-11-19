import 'package:southsea_cinema/models/movie.dart';

class BasketItem {
  final Movie movie;
  final int ticketQuantity;

  const BasketItem({required this.movie, required this.ticketQuantity});

  double get lineTotal => movie.adultPrice * ticketQuantity;
}
