import 'package:app/router.dart';
import 'package:flutter/foundation.dart';
import 'package:forui/forui.dart';
import 'package:material_ui/material_ui.dart';

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
