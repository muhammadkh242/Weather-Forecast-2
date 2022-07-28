import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/layout_provider.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:weather/module/settings/components/settings_components.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LayoutProvider>(
        create: (context) => LayoutProvider(),
        child: Consumer<LayoutProvider>(
            builder: (BuildContext context, layoutProvide, _) {
          return SettingsGroup(title: "settings", children: [
            buildDarkModeTile(),
            buildUnitsTile(),
            buildWindTile()
          ]);
        }));
  }
}
