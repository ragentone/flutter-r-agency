import 'package:app/bootstrap/bootstrap.dart';
import 'package:app/router/router.dart';
import 'package:flutter/foundation.dart';
import 'package:forui/forui.dart';
import 'package:material_ui/material_ui.dart';
import 'package:provider/provider.dart';

class RAgency extends StatelessWidget {
  const RAgency({super.key});

  @override
  Widget build(BuildContext context) {
    final (lightTheme, darkTheme) =
        const <TargetPlatform>{
          .android,
          .macOS,
          .iOS,
          .fuchsia,
        }.contains(defaultTargetPlatform)
        ? (FTheme.neutral.light.touch, FTheme.neutral.dark.touch)
        : (FTheme.neutral.light.desktop, FTheme.neutral.dark.desktop);

    final bootstrap = context.watch<Bootstrap>();

    if (!bootstrap.isBooted) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        supportedLocales: FLocalizations.supportedLocales,
        localizationsDelegates: const [
          ...FLocalizations.localizationsDelegates,
        ],
        theme: lightTheme.toApproximateMaterialTheme(),
        darkTheme: darkTheme.toApproximateMaterialTheme(),
        home: Scaffold(
          body: Center(
            child: CircularProgressIndicator(
              color: context.theme.colors.foreground,
            ),
          ),
          backgroundColor: context.theme.colors.background,
        ),
      );
    }

    return MaterialApp.router(
      supportedLocales: FLocalizations.supportedLocales,
      localizationsDelegates: const [...FLocalizations.localizationsDelegates],
      theme: lightTheme.toApproximateMaterialTheme(),
      darkTheme: darkTheme.toApproximateMaterialTheme(),
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      builder: (context, child) => FTheme(
        data: lightTheme,
        child: FToaster(child: FTooltipGroup(child: child!)),
      ),
    );
  }
}
