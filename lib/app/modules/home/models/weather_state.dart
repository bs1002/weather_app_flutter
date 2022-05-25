import 'package:equatable/equatable.dart';
import 'weather_info.dart';

class WeatherState extends Equatable {
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

class WeatherLoadFailed extends WeatherState {
  final Object error;
  const WeatherLoadFailed(this.error);

  @override
  List<Object> get props => [];
}
