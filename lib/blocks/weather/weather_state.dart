part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final List<WeatherInfo> weatherInfoList;
  const WeatherLoaded(this.weatherInfoList);

  @override
  List<Object> get props => [weatherInfoList];
}
