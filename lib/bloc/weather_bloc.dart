import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<FitchWeather>((event, emit) async{
      emit(WeatherLoading());
      try {
        WeatherFactory wf = WeatherFactory("API_KEY", language: Language.ENGLISH);
        Position position = await Geolocator.getCurrentPosition();
        Weather weather = await wf.currentWeatherByLocation(
         position.latitude,
         position.longitude 
        );
        emit(WeatherSuccess(weather));
      } catch (e) {
       emit(WeatherFailure()); 
      }
    });
  }
}
