import 'package:app/bootstrap/bootstrap.dart';
import 'package:material_ui/material_ui.dart';
import 'package:provider/provider.dart';

import 'app.dart';
export 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => Bootstrap()..boot())],
      child: const RAgency(),
    ),
  );
}
