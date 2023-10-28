import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'location_screen.dart';
import 'package:clima/services/weather.dart';

// Class for Loading Screen
class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    getLocationData();
    super.initState();
  }

  // This function gets the location and send back to the loading screen
  void getLocationData() async {
    var weatherData = await WeatherModel().getLocationScreen();

    Navigator.push(
      context as BuildContext,
      MaterialPageRoute(
        builder: (context) {
          return LocationScreen(
            locationWeather: weatherData,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        // SpinKit for loading animation
        child: SpinKitChasingDots(
          color: Colors.white,
          size: 150.0,
        ),
      ),
    );
  }
}
