import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WeatherParameterView extends StatelessWidget {
  final String parameterName, unit;
  final int value;
  final Color progressColor;

  const WeatherParameterView(
      {Key? key,
      required this.parameterName,
      required this.value,
      required this.unit,
      required this.progressColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          parameterName,
          style: GoogleFonts.lato(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(
          value.toString(),
          style: GoogleFonts.lato(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(
          unit,
          style: GoogleFonts.lato(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Stack(
          children: [
            Container(
              height: 5,
              width: 50,
              color: Colors.white38,
            ),
            Container(
              height: 5,
              width: value / 2,
              color: progressColor,
            ),
          ],
        ),
      ],
    );
  }
}
