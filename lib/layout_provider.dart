import 'package:flutter/material.dart';
import 'package:weather/module/home/home_screen.dart';
import 'package:weather/module/settings/settings_screen.dart';

class LayoutProvider extends ChangeNotifier {

  int bottomNavIndex = 0;
  List<Widget> pages = [
    const HomeScreen(),
    const SettingsScreen()
  ];

  void navigateBottomNavScreen(int index){
    bottomNavIndex = index;
    notifyListeners();
  }
}