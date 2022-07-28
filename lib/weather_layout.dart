import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/layout_provider.dart';
import 'package:hexcolor/hexcolor.dart';

class WeatherLayout extends StatelessWidget {
  const WeatherLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LayoutProvider>(
        create: (context) => LayoutProvider(),
        child: Consumer<LayoutProvider>(
            builder: (context, layoutProvider, _) {
          return Scaffold(
            backgroundColor: Colors.blue[100],
            appBar: AppBar(
              backgroundColor: Colors.blue[100],
              elevation: 0.0,
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: layoutProvider.bottomNavIndex,
              onTap: (index) {
                layoutProvider.navigateBottomNavScreen(index);
              },
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.calendar_today_outlined), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings_applications_outlined),
                    label: "Settings")
              ],
            ),
            body: layoutProvider.pages[layoutProvider.bottomNavIndex],
          );
        }));
  }
}
