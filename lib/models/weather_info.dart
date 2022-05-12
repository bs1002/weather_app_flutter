// Converted JSON -> Dart using (https://app.quicktype.io/)
// To parse this JSON data, do
// final weatherInfo = weatherInfoFromJson(jsonString);

import 'dart:convert';

List<WeatherInfo> weatherInfoFromJson(String str) => List<WeatherInfo>.from(
    json.decode(str).map((x) => WeatherInfo.fromJson(x)));

String weatherInfoToJson(List<WeatherInfo> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WeatherInfo {
  WeatherInfo({
    required this.city,
    required this.dateTime,
    required this.temparature,
    required this.weatherType,
    required this.bgUrl,
    required this.iconUrl,
    required this.wind,
    required this.rain,
    required this.humidity,
  });

  String city;
  String dateTime;
  String temparature;
  String weatherType;
  String bgUrl;
  String iconUrl;
  int wind;
  int rain;
  int humidity;

  factory WeatherInfo.fromJson(Map<String, dynamic> json) => WeatherInfo(
        city: json["city"],
        dateTime: json["dateTime"],
        temparature: json["temparature"],
        weatherType: json["weatherType"],
        bgUrl: json["bgUrl"],
        iconUrl: json["iconUrl"],
        wind: json["wind"],
        rain: json["rain"],
        humidity: json["humidity"],
      );

  Map<String, dynamic> toJson() => {
        "city": city,
        "dateTime": dateTime,
        "temparature": temparature,
        "weatherType": weatherType,
        "bgUrl": bgUrl,
        "iconUrl": iconUrl,
        "wind": wind,
        "rain": rain,
        "humidity": humidity,
      };
}
