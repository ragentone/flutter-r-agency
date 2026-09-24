import 'package:app/theme/theme_state.dart';
import 'package:forui/forui.dart';
import 'package:material_ui/material_ui.dart';

class LoadingScreen extends StatefulWidget {
  final FThemeData lightTheme;
  final FThemeData darkTheme;

  const LoadingScreen({
    super.key,
    required this.lightTheme,
    required this.darkTheme,
  });

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: ThemeState.mode,
      builder: (context, mode, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          supportedLocales: FLocalizations.supportedLocales,
          localizationsDelegates: const [
            ...FLocalizations.localizationsDelegates,
          ],
          theme: widget.lightTheme.toApproximateMaterialTheme(),
          darkTheme: widget.darkTheme.toApproximateMaterialTheme(),
          themeMode: mode,
          builder: (context, child) {
            final isDark = switch (mode) {
              ThemeMode.dark => true,
              ThemeMode.light => false,
              ThemeMode.system =>
                MediaQuery.platformBrightnessOf(context) == Brightness.dark,
            };

            return FTheme(
              data: isDark ? widget.darkTheme : widget.lightTheme,
              child: child!,
            );
          },
          home: Builder(
            builder: (context) => Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  color: context.theme.colors.foreground,
                ),
              ),
              backgroundColor: context.theme.colors.background,
            ),
          ),
        );
      },
    );
  }
}
