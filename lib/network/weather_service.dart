import 'dart:convert';

import '../model/weather_response.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  
  Future<WeatherResponse> fetchWeather() async {
    var uri = Uri.parse("https://api.openweathermap.org/data/2.5/onecall?units=en&lat=61.5240&lon=105.3188&appid=c67c9ddb5f0fa54ea9629f71fd2412d2");
    final response = await http.get(uri);
    //print(response.body);
    return WeatherResponse.fromJson(json.decode(response.body));
  }
  
}