import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:weather/main_provider.dart';
import 'package:weather/shared/constants.dart';

Widget buildDarkModeTile(LayoutProvider provider) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Container(
      padding: const EdgeInsets.only(
        left: 17.0,
        right: 17.0,
        bottom: 17.0
      ),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.4),
          borderRadius: const BorderRadius.all(Radius.circular(20.0))
      ),

      child: SwitchSettingsTile(
        onChange: (value) {
          provider.changeThemeMode();
        },
        title: "Dark Mode",
        settingKey: keyDark,
        leading: const Icon(Icons.dark_mode),
      ),
    ),
  );
}

Widget buildUnitsTile() {
  return Padding(
    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
    child: Container(
      padding: const EdgeInsets.only(
          left: 17.0,
          right: 17.0,
          bottom: 17.0
      ),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.4),
          borderRadius: const BorderRadius.all(Radius.circular(20.0))
      ),
      child: DropDownSettingsTile(
          title: "Unit System",
          settingKey: keyUnits,
          selected: 1,
          values: const {1: "metric", 2: "imperial", 3: "standard"}),
    ),
  );
}


