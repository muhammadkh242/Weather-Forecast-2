import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/layout_provider.dart';

class WeatherLayout extends StatelessWidget {
  const WeatherLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LayoutProvider>(
        create: (context) => LayoutProvider(),
        child: Consumer<LayoutProvider>(
            builder: (context, layoutProvider, _) {
          return Scaffold(
            appBar: AppBar(),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: layoutProvider.bottomNavIndex,
              onTap: (index) {
                layoutProvider.navigateBottomNavScreen(index);
              },
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.calendar_today_outlined), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite_border_outlined),
                    label: "Favorite"),
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
