import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/api/weather_api.dart';
import 'package:weather_app/cubit/weather_state.dart';
import 'package:weather_app/model/weather_model.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(InitState());

  // create a functions

  getWeather({required String cityName}) async {
    emit(WeatherLoadingState());
    try {
      WeatherModel weatherModel =
          await WeatherApi().getWeather(cityName: cityName);
      emit(WeatherSuccessState());
    } catch (e) {
      // TODO
      emit(WeatherFailuerState());
    }
  }
}
