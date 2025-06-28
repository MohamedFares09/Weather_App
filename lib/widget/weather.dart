import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_model.dart';

class Weather extends StatelessWidget {
  Weather({
    super.key,
    required this.weatherModel,
  });

  WeatherModel weatherModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            weatherModel.cityName,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          ),
          Text(
            weatherModel.lastUpdata,
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 2,
                child: Image.network(
                  weatherModel.image,
                  height: 40,
                  width: 40,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    print('Error loading image: $error');
                    print('Image URL: ${weatherModel.image}');
                    return Icon(
                      Icons.cloud,
                      size: 40,
                      color: Colors.grey,
                    );
                  },
                ),
              ),
              Flexible(
                flex: 1,
                child: Text(
                  ' ${weatherModel.avgTemp}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Maxtemp: ${weatherModel.maxTemp}',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      'Mintemp: ${weatherModel.minTemp}',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 32,
          ),
          Text(
            weatherModel.condition,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),
          ),
        ],
      ),
    );
  }
}
