import 'package:http/http.dart' as http;
import 'dart:convert';

// This NetworkHelper class fetches the weather data from API link and returns the data..
class NetworkHelper {
  late final String url;

  NetworkHelper(this.url);

  Future getWeatherData() async {
    http.Response response = await http.get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      var data = response.body;
      return jsonDecode(data);
    } else {
      return response.statusCode;
    }
  }
}
