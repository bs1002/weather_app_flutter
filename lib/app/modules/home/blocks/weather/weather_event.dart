part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class LoadWeather extends WeatherEvent {
  @override
  List<Object> get props => [];
}

class ReloadWeather extends WeatherEvent {}

class SearchWeather extends WeatherEvent {}
