import 'package:flutter/material.dart';
import 'package:weather/network/dio_client.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DioClient dioClient = DioClient();
    dioClient.getCurrentWeather();
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
