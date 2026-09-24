import 'package:material_ui/material_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeStorage {
  final String _key = 'app_theme_mode';

  Future<ThemeMode> get() async {
    final storage = await SharedPreferences.getInstance();
    return switch (storage.getString(_key)) {
      'light' => ThemeMode.light,
      'dark' => ThemeMode.dark,
      _ => ThemeMode.system,
    };
  }

  Future<void> set(ThemeMode mode) async {
    final storage = await SharedPreferences.getInstance();
    await storage.setString(_key, mode.name);
  }
}
