import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/layout_provider.dart';
import 'package:weather/module/home/home_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LayoutProvider>(
      create: (context) => LayoutProvider(),
      child: Consumer<LayoutProvider>(
          builder: (BuildContext context, layoutProvide, _) {
        return ChangeNotifierProvider<HomeProvider>(
          create: (context) => HomeProvider(),
          child: Consumer<HomeProvider>(
            builder: (context, homeProvider, _) {
              return Center(
                child: Text(
                  "${homeProvider.weatherResponse.timezone}",
                  style: const TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
