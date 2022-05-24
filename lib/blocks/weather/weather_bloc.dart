import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app_flutter/models/weather_info.dart';
import '../../services/weather_api_service.dart';
part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherApiService _weatherApiService;

  WeatherBloc(this._weatherApiService) : super(WeatherLoading()) {
    on<LoadWeather>(((event, emit) async {
      await _weatherApiService.getFutureWeatherInfoList().then((value) {
        emit(WeatherLoaded(value));
      }).onError((error, stackTrace) {
        emit(WeatherLoadFailed(error!));
      });
    }));
  }
}
