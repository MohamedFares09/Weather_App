import 'package:flutter/material.dart';
import 'package:weather_app/api/weather_api.dart';
import 'package:weather_app/model/weather_model.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search City"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 150,
            ),
            TextField(
              onSubmitted: (value) async {
                
                Navigator.pop(context);
              },
              maxLines: 2,
              decoration: InputDecoration(
                  hintText: "Search a city",
                  labelText: 'Search',
                  suffixIcon: Icon(Icons.search),
                  border: OutlineInputBorder()),
            )
          ],
        ),
      ),
    );
  }
}
