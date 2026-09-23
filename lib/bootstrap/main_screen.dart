import 'package:app/bootstrap/bootstrap.dart';
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

    return MaterialApp.router(
      supportedLocales: FLocalizations.supportedLocales,
      localizationsDelegates: const [...FLocalizations.localizationsDelegates],
      theme: widget.lightTheme.toApproximateMaterialTheme(),
      darkTheme: widget.darkTheme.toApproximateMaterialTheme(),
      routerConfig: bootstrap.router.instance,
      debugShowCheckedModeBanner: false,
      builder: (context, child) => FTheme(
        data: widget.lightTheme,
        child: FToaster(child: FTooltipGroup(child: child!)),
      ),
    );
  }
}
