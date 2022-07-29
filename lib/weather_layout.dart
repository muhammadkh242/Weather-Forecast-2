import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/layout_provider.dart';
import 'package:hexcolor/hexcolor.dart';

class WeatherLayout extends StatelessWidget {
  const WeatherLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LayoutProvider>(builder: (context, provider, _) {

      return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: provider.bottomNavIndex,
          onTap: (index) {
            provider.navigateBottomNavScreen(index);
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today_outlined), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings_applications_outlined),
                label: "Settings")
          ],
        ),
        body: provider.pages[provider.bottomNavIndex],
      );
    });
  }
}
