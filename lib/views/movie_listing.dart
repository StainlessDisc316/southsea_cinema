import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class MovieListing extends StatefulWidget {
  final int maxTickets = 5;
  const MovieListing({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MovieListingState();
  }
}

class _MovieListingState extends State<MovieListing> {
  int _ticketCount = 0;
  int _ticketsAdded = 0;
  double _triggerOpacity = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(appTitle, style: cinemaHeaderStyle),
          backgroundColor: cinemaSurface,
          iconTheme: const IconThemeData(color: cinemaBrand),
          elevation: 0,
        ),
        drawer: const NavDrawer(),
        body: Container(
          color: cinemaBackground,
          child: Center(
              // Can no longer be constant (stateful widget)
              child: Row(children: [
            SizedBox(width: 50),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 35),
                Text('THE MATRIX (1999) (15)',
                    style: TextStyle(fontSize: 26, color: cinemaFontWhite)),
                SizedBox(height: 35),
                Text(
                    'Southsea Cinema Room\n\n'
                    'Friday 2 Oct 2026 18:00 - ends at 20:16',
                    style: TextStyle(fontSize: 16, color: cinemaFontWhite)),
                SizedBox(height: 50),
                Text(
                    'Please note that Discounts / Membership Benefits will '
                    'be applied once you have selected your tickets\n\n'
                    'Select Quantities (Up to 5 in total)',
                    style: TextStyle(fontSize: 16, color: cinemaFontWhite)),
                SizedBox(height: 50),
                Text('Tickets', style: cinemaHeaderStyle),
                SizedBox(height: 15),
                Row(
                  children: [
                    DropdownMenu<int>(
                        width: 130,
                        trailingIcon: Icon(Icons.keyboard_arrow_down,
                            color: Colors.black
                            ),
                        textStyle: TextStyle(fontSize: 16, 
                        color: Colors.black),
                        inputDecorationTheme: InputDecorationTheme(
                          filled: true,
                          fillColor: cinemaFontWhite,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0),
                            borderSide: BorderSide.none,
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
                            DropdownMenuEntry<int>(value: i, label: '$i'),
                        ]),
                    SizedBox(width: 10),
                    Text('Adult (£7.50)', style: TextStyle(
                      fontSize: 16, 
                      color: cinemaFontWhite)),
                  ],
                ),
                SizedBox(height: 35),
                FilledButton(
                    style: FilledButton.styleFrom(minimumSize: Size(80, 45),
                      backgroundColor: cinemaBrand, shape:LinearBorder()
                    ),
                    onPressed: () {
                      _addTickets();
                    },
                    child: Text('ADD TO ORDER', style: TextStyle(
                      fontSize: 18,
                      color: cinemaFontWhite
                    )),
                ),
                SizedBox(height: 10),
                Text('${_ticketsAdded.toString()} ticket(s) added to order!',
                    style: TextStyle(
                        fontSize: 11,
                        color: cinemaBrand.withValues(
                          alpha: _triggerOpacity))),
              ],
            ),
          ])),
        ));
  }

  void _addTickets() {
    if (_ticketCount != 0 && _ticketCount <= widget.maxTickets) {
      setState(() {
        _ticketsAdded += _ticketCount;
        _triggerOpacity = 1.0; // Show the message
        _ticketCount = 0; // Reset the ticket count after adding
      });
    }
  }
}
