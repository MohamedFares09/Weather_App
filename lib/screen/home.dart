import 'package:flutter/material.dart';
import 'package:weather_app/screen/search.dart';
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
      body: Weather(),
    );
  }
}
