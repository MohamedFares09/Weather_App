import 'package:flutter/material.dart';

MaterialColor getThemeColor(String condition) {
  switch (condition.toLowerCase()) {
    case 'sunny':
    case 'clear':
    case 'sun':
      return Colors.amber;
    case 'cloudy':
    case 'partly cloudy':
    case 'overcast':
      return Colors.blueGrey;
    case 'rainy':
    case 'rain':
    case 'drizzle':
    case 'light rain':
    case 'moderate rain':
    case 'heavy rain':
      return Colors.blue;
    case 'snowy':
    case 'snow':
    case 'light snow':
    case 'heavy snow':
      return Colors.cyan;
    case 'night':
    case 'clear night':
    case 'partly cloudy night':
      return Colors.indigo;
    case 'stormy':
    case 'thunderstorm':
    case 'storm':
      return Colors.deepPurple;
    case 'foggy':
    case 'mist':
    case 'haze':
      return Colors.grey;
    case 'windy':
    case 'breezy':
      return Colors.teal;
    case 'hot':
    case 'very hot':
      return Colors.orange;
    case 'cold':
    case 'very cold':
      return Colors.lightBlue;
    default:
      return Colors.amber;
  }
}
