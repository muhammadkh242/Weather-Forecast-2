import 'package:flutter/material.dart';
import 'package:weather/network/dio_client.dart';
import 'package:weather/network/weather_service.dart';
import 'package:weather/repository/repository.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // WeatherService().fetchWeather();
    WeatherRepo weatherRepo = WeatherRepo(DioClient());
    weatherRepo.getCurrentWeather().then((value)
    {
      print(value.timezone);
    });
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text(
          "home",
        ),
      ),
    );
  }
}
