import 'package:get/get.dart';
import '../services/weather_api_service.dart';
import '../models/weather_state.dart';

class WeatherController extends GetxController {
  final WeatherApiService _weatherApiService = WeatherApiService();

  var weatherState = const WeatherState().obs;

  @override
  void onInit() {
    super.onInit();
    weatherState.value = WeatherLoading();
    loadWeatherInfo();
  }

  void loadWeatherInfo() async {
    await _weatherApiService.getFutureWeatherInfoList().then((value) {
      weatherState.value = WeatherLoaded(value);
    }).onError((error, stackTrace) {
      weatherState.value = WeatherLoadFailed(error!);
    });
  }
}
