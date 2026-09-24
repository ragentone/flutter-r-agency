import 'package:app/bootstrap/bootstrap.dart';
import 'package:app/theme/theme_state.dart';
import 'package:forui/forui.dart';
import 'package:material_ui/material_ui.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  final FThemeData lightTheme;
  final FThemeData darkTheme;

  const MainScreen({
    super.key,
    required this.lightTheme,
    required this.darkTheme,
  });

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final bootstrap = context.read<Bootstrap>();

    return ValueListenableBuilder<ThemeMode>(
      valueListenable: ThemeState.mode,
      builder: (context, mode, child) {
        return MaterialApp.router(
          supportedLocales: FLocalizations.supportedLocales,
          localizationsDelegates: const [
            ...FLocalizations.localizationsDelegates,
            ...GlobalMaterialLocalizations.delegates,
          ],
          theme: widget.lightTheme.toApproximateMaterialTheme(),
          darkTheme: widget.darkTheme.toApproximateMaterialTheme(),
          themeMode: mode,
          routerConfig: bootstrap.router.instance,
          debugShowCheckedModeBanner: false,
          builder: (context, child) {
            final isDark = switch (mode) {
              ThemeMode.dark => true,
              ThemeMode.light => false,
              ThemeMode.system =>
                MediaQuery.platformBrightnessOf(context) == Brightness.dark,
            };

            return FTheme(
              data: isDark ? widget.darkTheme : widget.lightTheme,
              child: FToaster(
                child: FTooltipGroup(child: Stack(children: [child!])),
              ),
            );
          },
        );
      },
    );
  }
}
