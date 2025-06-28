class WeatherModel {
  final String cityName;
  final String lastUpdata;
  final String image;
  final double avgTemp;
  final double maxTemp;
  final double minTemp;
  final String condition;

  WeatherModel(
      {required this.cityName,
      required this.lastUpdata,
      required this.image,
      required this.avgTemp,
      required this.maxTemp,
      required this.minTemp,
      required this.condition});

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    String imageUrl =
        'https:${json['forecast']['forecastday'][0]['day']['condition']['icon']}';
    print('Image URL: $imageUrl');

    return WeatherModel(
      cityName: json['location']['name'] ?? 'cario',
      lastUpdata: json['location']['localtime'],
      image: imageUrl,
      avgTemp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      condition: json['forecast']['forecastday'][0]['day']['condition']['text'],
    );
  }
}
