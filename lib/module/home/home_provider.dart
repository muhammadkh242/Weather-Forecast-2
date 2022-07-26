import 'package:flutter/material.dart';
import 'package:weather/network/dio_client.dart';
import 'package:weather/repository/repository.dart';

import '../../model/weather_response.dart';

class HomeProvider extends ChangeNotifier {
  
  final WeatherRepo _weatherRepo = WeatherRepo(DioClient());
  WeatherResponse weatherResponse = WeatherResponse();

  HomeProvider(){
    getCurrentWeather();
  }

  void getCurrentWeather(){
    _weatherRepo.getCurrentWeather().then((value)
    {
      weatherResponse = value;
      notifyListeners();
    });
  }

}