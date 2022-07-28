import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:weather/shared/constants.dart';

Widget buildDarkModeTile(){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: SwitchSettingsTile(
        title: "Dark Mode",
        settingKey: keyDark,
      leading: Icon(Icons.dark_mode),
    ),
  );
}

Widget buildUnitsTile(){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: DropDownSettingsTile(
        title: "Unit System",
        settingKey: keyUnits,
        selected: 1,
        values: const {
          1: "metric",
          2: "imperial",
          3: "standard"
        }),
  );
}

Widget buildWindTile(){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: DropDownSettingsTile(
        title: "Wind Speed",
        settingKey: keyUnits,
        selected: 1,
        values: const {
          1: "mph",
          2: "m/s",
        }),
  );
}