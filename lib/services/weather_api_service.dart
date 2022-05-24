import 'package:weather_app_flutter/constants/app_constants.dart';
import 'package:weather_app_flutter/models/weather_info.dart';
import 'package:weather_app_flutter/services/api_service.dart';

class WeatherApiService extends ApiService {
  var baseUrl = AppConstants.weatherApiBaseUrl;

  Future<List<WeatherInfo>> getFutureWeatherInfoList() async {
    var url = baseUrl + "weather_info.json";
    var responseJson = await get(url);
    return weatherInfoFromJson(responseJson);
  }
}
