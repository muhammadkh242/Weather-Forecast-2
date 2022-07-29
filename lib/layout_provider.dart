import 'package:flutter/material.dart';
import 'package:weather/module/home/home_screen.dart';
import 'package:weather/module/settings/settings_screen.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:weather/shared/constants.dart';

class LayoutProvider extends ChangeNotifier {

  int bottomNavIndex = 0;
  List<Widget> pages = [
    const HomeScreen(),
    const PreferencesScreen()
  ];

  void navigateBottomNavScreen(int index){
    bottomNavIndex = index;
    notifyListeners();
  }

  void changeThemeMode(){
    notifyListeners();
  }
}