import 'package:flutter/material.dart';
import 'package:weather/weather_layout.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

void main() async {
  await Settings.init(cacheProvider: SharePreferenceCache());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.blue[100],
            statusBarIconBrightness: Brightness.dark,
          ),

        )
      ),
      debugShowCheckedModeBanner: false,
      home: WeatherLayout(),
    );
  }
}
