import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/weather_cubit.dart';
import 'package:weather_app/cubit/weather_state.dart';
import 'package:weather_app/screen/search.dart';
import 'package:weather_app/widget/no_weather.dart';
import 'package:weather_app/widget/weather.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather App"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return Search();
                    },
                  ),
                );
              },
              icon: Icon(Icons.search))
        ],
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is InitState) {
            return NoWeather();
          } else if (state is WeatherSuccessState) {
            return Weather(weatherModel: state.weatherModel);
          } else {
            return Text("opps there was an error");
          }
        },
      ),
    );
  }
}
