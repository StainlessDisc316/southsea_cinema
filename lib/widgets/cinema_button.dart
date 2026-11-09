import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';

class CinemaButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final TextStyle? textStyle;

  const CinemaButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: cinemaBrand,
        foregroundColor: cinemaFontWhite,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: textStyle,
      ),
    );
  }
}