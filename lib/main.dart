import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:weather/main_provider.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:weather/shared/constants.dart';
import 'package:weather/weather_layout.dart';
import 'package:hexcolor/hexcolor.dart';

void main() async {
  await Settings.init(cacheProvider: SharePreferenceCache());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LayoutProvider>(
        create: (context) => LayoutProvider(),
        child: Consumer<LayoutProvider>(
            builder: (BuildContext context, provider, _) {

          return MaterialApp(
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.blue[100],
              primarySwatch: Colors.yellow,
              appBarTheme: AppBarTheme(
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.blue[100],
                  statusBarIconBrightness: Brightness.dark,
                ),
                color: Colors.blue[100],
                titleTextStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                ),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.yellow[600],
                elevation: 50.0,
              ),
            ),
            darkTheme: ThemeData(
              scaffoldBackgroundColor: HexColor('323232'),
              primarySwatch: Colors.yellow,
              appBarTheme: AppBarTheme(
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: HexColor('323232'),
                  statusBarIconBrightness: Brightness.light,
                ),
                color: HexColor('323232'),
                titleTextStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                ),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.yellow[300],
                elevation: 50.0,
                backgroundColor: HexColor('323232'),
                unselectedItemColor: Colors.grey,
              ),
            ),
            themeMode: Settings.getValue(keyDark, false) ? ThemeMode.dark : ThemeMode.light,
            debugShowCheckedModeBanner: false,
            home: const WeatherLayout(),
          );
        }));
  }
}
