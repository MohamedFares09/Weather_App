import 'package:weather_app/model/weather_model.dart';

class WeatherState {}

class InitState extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherSuccessState extends WeatherState {
  final WeatherModel weatherModel;
  WeatherSuccessState(this.weatherModel);
}

class WeatherFailuerState extends WeatherState {
  final String errorMessage;
  WeatherFailuerState(this.errorMessage);
}
