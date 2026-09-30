import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class MovieListing extends StatelessWidget {
  const MovieListing({super.key});

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
          color: cinemaSurface,
          child: const Center(
              child: Row(children: [
            SizedBox(width: 50),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50),
                Text('THE MATRIX (1999) (15)', style: TextStyle(fontSize: 26)),
                SizedBox(height: 35),
                Text(
                    'Southsea Cinema Room\n\n'
                    'Friday 2 Oct 2026 18:00 - ends at 20:16',
                    style: TextStyle(fontSize: 16)),
                SizedBox(height: 50),
                Text(
                    'Please note that Discounts / Membership Benefits will '
                    'be applied once you have selected your tickets\n\n'
                    'Select Quantities (Up to 5 in total)',
                    style: TextStyle(fontSize: 16)),
              ],
            ),
          ])),
        ));
  }
}
