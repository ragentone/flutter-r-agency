import 'package:app/bootstrap/bootstrap.dart';
import 'package:app/bootstrap/state_provider.dart';
import 'package:app/config/config_service.dart';
import 'package:app/graphql/graphql_provider.dart';
import 'package:app/user/user_provider.dart';
import 'package:material_ui/material_ui.dart';
import 'package:provider/provider.dart';

import 'app.dart';
export 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => StateProvider()),
        ChangeNotifierProvider(create: (_) => Bootstrap()..boot()),
        ChangeNotifierProvider(create: (ctx) => GraphqlProvider()..boot(ctx)),
        ChangeNotifierProvider(create: (ctx) => UserProvider()..boot(ctx)),
      ],
      child: const RAgency(),
    ),
  );
}
