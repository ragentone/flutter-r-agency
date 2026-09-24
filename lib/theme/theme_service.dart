import 'package:app/theme/theme_state.dart';
import 'package:app/theme/theme_storage.dart';
import 'package:material_ui/material_ui.dart';

class ThemeService {
  final ThemeStorage _storage = ThemeStorage();
  final ThemeState _state = ThemeState();

  Future<void> load() async {
    _state.set(await _storage.get());
  }

  Future<void> setMode(ThemeMode mode) async {
    _state.set(mode);
    await _storage.set(mode);
  }

  /// Flips between light and dark, using [isDark] as the currently
  /// displayed appearance (which may come from the system when the mode
  /// is [ThemeMode.system]).
  Future<void> toggle(bool isDark) async {
    await setMode(isDark ? ThemeMode.light : ThemeMode.dark);
  }
}
