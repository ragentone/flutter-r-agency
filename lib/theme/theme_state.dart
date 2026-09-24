import 'package:material_ui/material_ui.dart';

class ThemeState {
  static final ValueNotifier<ThemeMode> mode = ValueNotifier<ThemeMode>(
    ThemeMode.system,
  );

  void set(ThemeMode value) {
    mode.value = value;
  }
}
