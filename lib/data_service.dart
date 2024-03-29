import 'dart:convert';

import 'package:flutterproject/models.dart';
import 'package:http/http.dart' as http;

class DataService{
  Future<WeatherResponse> getWeather(String city, String units) async {
    // api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}
    final queryParameters = {
      'q': city, 
      'appid': '6791b39084c618eabd73e2a951e87a72',
      'units': units
    };

    final uri = Uri.https(
      'api.openweathermap.org', '/data/2.5/weather', queryParameters);

    final response = await http.get(uri);
    print(response.body);
    final json = jsonDecode(response.body);
    return WeatherResponse.fromJson(json);
  }

}