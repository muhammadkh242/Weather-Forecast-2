import 'package:flutter/material.dart';
import 'package:weather/ui/home/home_screen.dart';
import 'package:weather/ui/settings/settings_screen.dart';


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