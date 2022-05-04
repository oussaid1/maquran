import 'package:flutter/material.dart';
import 'package:maquran/components.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box('settings').listenable(),
      builder: (context, Box box, widget) {
        return Switch(
            value: box.get('darkMode'),
            onChanged: (val) {
              box.put('darkMode', val);
            });
      },
    );
  }
}
