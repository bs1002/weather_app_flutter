import 'dart:async';
import '../models/weather_info.dart';
import '../services/weather_api_service.dart';

enum WeatherEvent { fetch, reload, search }

class WeatherBloc {
  final _stateStreamController = StreamController<List<WeatherInfo>>();
  StreamSink<List<WeatherInfo>> get weatherInfoListSink =>
      _stateStreamController.sink;
  Stream<List<WeatherInfo>> get weatherInfoListStream =>
      _stateStreamController.stream;

  final _eventStreamController = StreamController<WeatherEvent>();
  StreamSink<WeatherEvent> get eventSink => _eventStreamController.sink;
  Stream<WeatherEvent> get eventStream => _eventStreamController.stream;

  WeatherBloc() {
    eventStream.listen((event) {
      if (event == WeatherEvent.fetch) {
        weatherInfoListSink.addStream(
            WeatherApiService().getFutureWeatherInfoList().asStream());
      }
    });
  }

  void dispose() {
    _stateStreamController.close();
    _eventStreamController.close();
  }
}
