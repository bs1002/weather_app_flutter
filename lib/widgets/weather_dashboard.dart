import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app_flutter/models/weather_info.dart';
import 'package:weather_app_flutter/widgets/weather_parameter_view.dart';

class WeatherDashboard extends StatelessWidget {
  final WeatherInfo weatherInfo;
  const WeatherDashboard(this.weatherInfo, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 150),
          Text(
            weatherInfo.city,
            style: GoogleFonts.lato(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            weatherInfo.dateTime,
            style: GoogleFonts.lato(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                weatherInfo.temparature,
                style: GoogleFonts.lato(
                  fontSize: 85,
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                ),
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    weatherInfo.iconUrl,
                    width: 34,
                    height: 34,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    weatherInfo.weatherType,
                    style: GoogleFonts.lato(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 40),
            decoration:
                BoxDecoration(border: Border.all(color: Colors.white30)),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                WeatherParameterView(
                  parameterName: "wind",
                  value: weatherInfo.wind,
                  unit: "km/h",
                  progressColor: Colors.green,
                ),
                WeatherParameterView(
                  parameterName: "Rain",
                  value: weatherInfo.rain,
                  unit: "%",
                  progressColor: Colors.red,
                ),
                WeatherParameterView(
                  parameterName: "Humidity",
                  value: weatherInfo.humidity,
                  unit: "%",
                  progressColor: Colors.red,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
