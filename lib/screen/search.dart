import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/weather_cubit.dart';
import 'package:weather_app/cubit/weather_state.dart';
import 'package:weather_app/utils/theme_utils.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        final primaryColor = _getPrimaryColor(state);

        return Scaffold(
          backgroundColor: _getBackgroundColor(state),
          appBar: AppBar(
            title: Text(
              "Search City",
              style: TextStyle(
                color: _getTextColor(primaryColor),
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: primaryColor,
            elevation: 0,
            iconTheme: IconThemeData(color: _getTextColor(primaryColor)),
          ),
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  _getBackgroundColor(state),
                  _getBackgroundColor(state).withOpacity(0.8),
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const SizedBox(height: 100),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: primaryColor.withOpacity(0.2),
                          blurRadius: 15,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.location_city,
                          size: 60,
                          color: primaryColor,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "Enter City Name",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: _getTextColor(primaryColor),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Search for weather information in any city around the world",
                          style: TextStyle(
                            fontSize: 14,
                            color: _getTextColor(primaryColor).withOpacity(0.7),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 30),
                        TextField(
                          onSubmitted: (value) async {
                            if (value.trim().isNotEmpty) {
                              context
                                  .read<WeatherCubit>()
                                  .getWeather(cityName: value.trim());
                              Navigator.pop(context);
                            }
                          },
                          maxLines: 1,
                          textInputAction: TextInputAction.search,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(20),
                            hintText: "e.g., Cario, Alex",
                            labelText: 'City Name',
                            suffixIcon: Icon(Icons.search, color: primaryColor),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: primaryColor),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide:
                                  BorderSide(color: primaryColor, width: 2),
                            ),
                            filled: true,
                            fillColor: Colors.grey[50],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  MaterialColor _getPrimaryColor(WeatherState state) {
    if (state is WeatherSuccessState) {
      return getThemeColor(state.weatherModel.condition);
    }
    return Colors.amber;
  }

  Color _getBackgroundColor(WeatherState state) {
    if (state is WeatherSuccessState) {
      return getThemeColor(state.weatherModel.condition).withOpacity(0.1);
    }
    return const Color(0xFFFFF8E1);
  }

  Color _getTextColor(MaterialColor primaryColor) {
    // اختيار لون النص بناءً على لون الخلفية
    if (primaryColor == Colors.amber ||
        primaryColor == Colors.orange ||
        primaryColor == Colors.cyan ||
        primaryColor == Colors.lightBlue) {
      return Colors.black87;
    }
    return Colors.white;
  }
}
