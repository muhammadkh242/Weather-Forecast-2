import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/main_provider.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:weather/ui/settings/components/settings_components.dart';

class PreferencesScreen extends StatelessWidget {
  const PreferencesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LayoutProvider>(
        builder: (BuildContext context, provider, _) {
      return SettingsGroup(title: 'General', children: [
        buildDarkModeTile(provider),
        buildUnitsTile(),
      ]);
    });
  }
}
