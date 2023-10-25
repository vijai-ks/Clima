import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    getLocation();
    super.initState();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.longitude);

    http.Response response = await http.get(
      Uri.parse(
          'https://samples.openweathermap.org/data/2.5/forecast?id=524901&appid=b1b15e88fa797225412429c1c50c122a1'),
    );

    var data = response.body;

    // Using var keyword because the data is dynamic.
    var decodedData = jsonDecode(data);

    var cityName = decodedData['city']['name'];
    var cityID = decodedData['city']['id'];
    var currentTemperature = decodedData['list'][0]['main']['temp'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            //Get the current location
          },
          child: const Text('Get Location'),
        ),
      ),
    );
  }
}
