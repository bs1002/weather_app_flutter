import 'package:weather_app_flutter/constants/app_constants.dart';
import 'package:weather_app_flutter/models/weather_info.dart';
import 'package:http/http.dart' as http;

class WeatherApiService {
  Future<List<WeatherInfo>> getWeatherInfoList() async {
    var client = http.Client();
    var url = AppConstants.weatherApiBaseUrl + "weather_info.json";

    try {
      var response = await client.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return weatherInfoFromJson(response.body);
      }
    } catch (e) {
      return Future.error(e);
    }
    return Future.error("Failed to fetch data");
  }
}
