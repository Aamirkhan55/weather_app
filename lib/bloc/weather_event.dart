part of 'weather_bloc.dart';

sealed class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class FitchWeather extends WeatherEvent {
  final Position position;

  const FitchWeather(this.position);

   @override
  List<Object> get props => [position];
}
