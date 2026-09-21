import 'package:app/config/config_manager.dart';
import 'package:app/config/provider/config_provider.dart';
import 'package:app/user/models/user_model.dart';
import 'package:app/user/provider/user_auth_provider.dart';
import 'package:app/user/services/auth_service.dart';
import 'package:app/user/services/user_auth_service.dart';
import 'package:material_ui/material_ui.dart';
import 'package:provider/provider.dart';

import 'app.dart';
export 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ConfigManager.loadEnv();
  await ConfigManager.load();
  await UserAuthService.build();
  await UserAuthService.load();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ConfigProvider()),
        ChangeNotifierProvider(
          create: (_) =>
              UserAuthProvider(service: AuthService(), model: UserModel()),
        ),
      ],
      child: RAgency(),
    ),
  );
}
