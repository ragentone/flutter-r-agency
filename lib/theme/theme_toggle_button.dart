import 'package:app/theme/theme_service.dart';
import 'package:app/theme/theme_state.dart';
import 'package:forui/forui.dart';
import 'package:material_ui/material_ui.dart';

class ThemeToggleButton extends StatelessWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeService service = ThemeService();

    return ValueListenableBuilder<ThemeMode>(
      valueListenable: ThemeState.mode,
      builder: (context, mode, child) {
        final isDark = switch (mode) {
          ThemeMode.dark => true,
          ThemeMode.light => false,
          ThemeMode.system =>
            MediaQuery.platformBrightnessOf(context) == Brightness.dark,
        };

        return FHeaderAction(
          icon: Icon(isDark ? FLucideIcons.sun : FLucideIcons.moon, size: 18),
          onPress: () => service.toggle(isDark),
        );
      },
    );
  }
}
