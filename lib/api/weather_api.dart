import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/model/weather_model.dart';

class WeatherApi {
  String baseURL = "https://api.weatherapi.com/v1";
  Future<WeatherModel> getWeather({required String cityName}) async {
    Dio dio = Dio();
    try {
      final Response response = await dio.get(
          '$baseURL/forecast.json?key=899e2e3cf2f944d38c8102317243007&q=$cityName');

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      log(weatherModel.cityName);
      return weatherModel;
    } on DioException catch (e) {
      // error model
      final String errorMessage = e.response?.data?['error']?['message'] ??
          "Oops there was an error, try again";
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception("Oops there was an error, try again");
    }
  }
}
