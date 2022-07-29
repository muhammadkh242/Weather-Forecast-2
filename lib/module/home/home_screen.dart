import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/layout_provider.dart';
import 'package:weather/model/weather_response.dart';
import 'package:weather/module/home/components/home_components.dart';
import 'package:weather/module/home/home_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LayoutProvider>(
        builder: (BuildContext context, layoutProvide, _) {
      return ChangeNotifierProvider<HomeProvider>(
        create: (context) => HomeProvider(),
        child: Consumer<HomeProvider>(
          builder: (context, homeProvider, _) {
            return buildHomeScreen(
                context, homeProvider.weatherResponse, homeProvider);
          },
        ),
      );
    });
  }
}
