import 'package:flutter/material.dart';

// Constants for Text with various styles
const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

// TextField input box style
const kInputBoxDecorationStyle = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(
    Icons.location_city,
    size: 40.0,
    color: Colors.white,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
    borderSide: BorderSide.none,
  ),
  hintText: 'Enter a City Name',
  hintStyle: TextStyle(
    color: Colors.grey,
    fontSize: 20.0,
  ),
);

// This ID is an unique ID generated from the API Site
const apiKey = 'a584746887fbcfd49d1b26227650d686';

// Weather API Fetching link
const weatherAPILink = 'https://api.openweathermap.org/data/2.5/weather';
