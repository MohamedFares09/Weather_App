import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/weather_cubit.dart';
import 'package:weather_app/cubit/weather_state.dart';
import 'package:weather_app/screen/search.dart';
import 'package:weather_app/widget/no_weather.dart';
import 'package:weather_app/widget/weather.dart';
import 'package:weather_app/utils/theme_utils.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: _getBackgroundColor(state),
          appBar: AppBar(
            title: Text(
              "Weather App",
              style: TextStyle(
                color: _getTextColor(state),
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: _getAppBarColor(state),
            elevation: 0,
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return const Search();
                        },
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.search,
                    color: _getTextColor(state),
                  ))
            ],
          ),
          body: _buildBody(state),
        );
      },
    );
  }

  Widget _buildBody(WeatherState state) {
    if (state is WeatherLoadingState) {
      return Center(
        child: CircularProgressIndicator(
          color: _getPrimaryColor(state),
        ),
      );
    } else if (state is InitState) {
      return const NoWeather();
    } else if (state is WeatherSuccessState) {
      return Weather(weatherModel: state.weatherModel);
    } else {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: _getPrimaryColor(state),
            ),
            const SizedBox(height: 16),
            Text(
              "Oops! There was an error",
              style: TextStyle(
                fontSize: 18,
                color: _getPrimaryColor(state),
              ),
            ),
          ],
        ),
      );
    }
  }

  Color _getAppBarColor(WeatherState state) {
    if (state is WeatherSuccessState) {
      return getThemeColor(state.weatherModel.condition);
    }
    return Colors.amber;
  }

  Color _getBackgroundColor(WeatherState state) {
    if (state is WeatherSuccessState) {
      return getThemeColor(state.weatherModel.condition);
    }
    return const Color(0xFFFFF8E1);
  }

  Color _getPrimaryColor(WeatherState state) {
    if (state is WeatherSuccessState) {
      return getThemeColor(state.weatherModel.condition);
    }
    return Colors.amber;
  }

  Color _getTextColor(WeatherState state) {
    if (state is WeatherSuccessState) {
      // اختيار لون النص بناءً على لون الخلفية
      final backgroundColor = getThemeColor(state.weatherModel.condition);
      if (backgroundColor == Colors.amber ||
          backgroundColor == Colors.orange ||
          backgroundColor == Colors.cyan) {
        return Colors.black87;
      }
      return Colors.white;
    }
    return Colors.black87;
  }
}
