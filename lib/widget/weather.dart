import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/utils/theme_utils.dart';

class Weather extends StatelessWidget {
  Weather({
    super.key,
    required this.weatherModel,
  });

  WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    final primaryColor = getThemeColor(weatherModel.condition);

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            primaryColor.withOpacity(0.1),
            primaryColor.withOpacity(0.05),
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weatherModel.cityName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
                color: _getTextColor(primaryColor),
              ),
            ),
            Text(
              "Updated at ${weatherModel.lastUpdata.hour} : ${weatherModel.lastUpdata.minute}",
              style: TextStyle(
                fontSize: 24,
                color: _getTextColor(primaryColor).withOpacity(0.7),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: primaryColor.withOpacity(0.3),
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: primaryColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Image.network(
                      weatherModel.image.startsWith('https:')
                          ? weatherModel.image
                          : "https:${weatherModel.image}",
                      height: 40,
                      width: 40,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(
                          Icons.cloud,
                          size: 40,
                          color: primaryColor,
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: Text(
                      '${weatherModel.avgTemp}°',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        color: _getTextColor(primaryColor),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Max: ${weatherModel.maxTemp.round()}°',
                        style: TextStyle(
                          fontSize: 14,
                          color: _getTextColor(primaryColor).withOpacity(0.8),
                        ),
                      ),
                      Text(
                        'Min: ${weatherModel.minTemp.round()}°',
                        style: TextStyle(
                          fontSize: 14,
                          color: _getTextColor(primaryColor).withOpacity(0.8),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: primaryColor.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Text(
                weatherModel.condition,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  color: _getTextColor(primaryColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
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
