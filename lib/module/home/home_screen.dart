import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/layout_provider.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
/*    WeatherRepo weatherRepo = WeatherRepo(DioClient());
    weatherRepo.getCurrentWeather().then((value)
    {
      print(value.daily!.length);
    });*/
    return ChangeNotifierProvider<LayoutProvider>(
      create: (context) => LayoutProvider(),
      child: Consumer<LayoutProvider>(
          builder: (BuildContext context , layoutProvide, _){
            return const Center(
              child: Text(
                "Home",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }
      )
    );
  }
}
/*return Consumer<LayoutProvider>(
        builder: (BuildContext context , layoutProvide, _){
          return const Center(
            child: Text(
              "Home",
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        }
    );*/