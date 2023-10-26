import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// This ID is an unique ID generated from the API Site
const apiKey = 'a584746887fbcfd49d1b26227650d686';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late double longitude;
  late double latitude;

  @override
  void initState() {
    getLocation();
    super.initState();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    longitude = location.longitude;
    latitude = location.latitude;

    getData();
  }

  void getData() async {
    http.Response response = await http.get(
      Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey'),
    );

    var data = response.body;
    print(latitude);
    print(longitude);

    // Using var keyword because the data is dynamic.
    var decodedData = jsonDecode(data);

    var cityName = decodedData['name'];
    var condition = decodedData['weather'][0]['id'];
    var currentTemperature = decodedData['main']['temp'];

    print(cityName);
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
