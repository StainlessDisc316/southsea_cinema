import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';
import 'package:southsea_cinema/widgets/cinema_button.dart';
import 'package:southsea_cinema/models/basket_item.dart';
import 'package:southsea_cinema/repositories/basket_repository.dart';

class MovieListing extends StatefulWidget {
  final Movie movie;
  final int maxTickets = 5;
  const MovieListing({
    super.key,
    required this.movie,
  });

  @override
  State<MovieListing> createState() {
    return _MovieListingState();
  }
}

class _MovieListingState extends State<MovieListing> {
  int _ticketCount = 0;

  @override
  Widget build(BuildContext context) {
    final content = _buildPostingElements();
    return Scaffold(
      backgroundColor: cinemaBackground,
      appBar: AppBar(
        title: const Text(
          appTitle,
        ),
      ),
      drawer: const NavDrawer(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          debugPrint('Available width: ${constraints.maxWidth}');
          if (constraints.maxWidth > 850) {
            return Center(
              child: Row(children: [
                SizedBox(
                  width: 50,
                ),
                Expanded(
                    child: Container(color: cinemaSurface, child: content)),
              ]),
            );
          }
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 16),
            child: Container(
                color: cinemaSurface,
                padding: const EdgeInsets.all(16),
                child: content),
          );
        },
      ),
    );
  }

  Widget _buildPostingElements() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            '${widget.movie.title} (${widget.movie.yearReleased}) (${widget.movie.rating})',
            style: TextStyle(
              color: cinemaFontWhite,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            )),
        SizedBox(
          height: 10,
        ),
        Image.asset(
          widget.movie.imagePath,
          width: 100,
          height: 165,
          fit: BoxFit.cover,
        ),
        SizedBox(
          height: 10,
        ),
        Text(widget.movie.room,
            style: TextStyle(
              color: cinemaFontWhite,
              fontSize: 14,
            )),
        SizedBox(
          height: 5,
        ),
        Text('${widget.movie.screeningDate} ${widget.movie.screeningTime}',
            style: TextStyle(
              color: cinemaFontWhite,
              fontSize: 14,
            )),
        SizedBox(
          height: 10,
        ),
        Text(widget.movie.synopsis,
            style: TextStyle(
              color: cinemaFontWhite,
              fontSize: 14,
            )),
        SizedBox(
          height: 15,
        ),
        Wrap(
          spacing: 78,
          runSpacing: 10,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 13),
              child: Text('Tickets (${widget.movie.formattedPrice} each)',
                  style: TextStyle(
                    color: cinemaFontWhite,
                    fontSize: 14,
                  )),
            ),
            DropdownMenu<int>(
                width: 118,
                textStyle: TextStyle(
                  color: cinemaFontWhite,
                  fontSize: 16,
                ),
                inputDecorationTheme: InputDecorationTheme(
                  filled: true,
                  fillColor: cinemaSurface,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: cinemaFontMuted,
                      width: 1,
                    ),
                  ),
                ),
                initialSelection: _ticketCount,
                onSelected: (int? value) {
                  if (value != null) {
                    setState(() {
                      _ticketCount = value;
                    });
                  }
                },
                dropdownMenuEntries: [
                  for (int i = 0; i <= widget.maxTickets; i++)
                    DropdownMenuEntry<int>(
                      value: i,
                      label: '$i',
                    ),
                ]),
          ],
        ),
        SizedBox(height: 15),
        CinemaButton(
          label: 'Add to order',
          textStyle: TextStyle(
            color: cinemaFontWhite,
            fontSize: 14,
          ),
          onPressed: () {
            _addTickets();
          },
        ),
      ],
    );
  }

  void _addTickets() {
    if (_ticketCount == 0 || _ticketCount > widget.maxTickets) {
      return;
    }

    BasketRepository.instance.addItem(
      BasketItem(
        movie: widget.movie,
        ticketQuantity: _ticketCount,
      ),
    );

    setState(() {
      _ticketCount = 0;
    });

  final basket = BasketRepository.instance;
    debugPrint(
      basket.getBasketItems()
          .map((item) =>
              '${item.ticketQuantity} x ${item.movie.title}')
          .join(', '),
    );
    debugPrint('Ticket count: ${basket.totalTicketCount}');
    debugPrint('Total: £${basket.getTotal().toStringAsFixed(2)}');
  
  }
}
