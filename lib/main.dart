import 'package:app/config/config_manager.dart';
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
  runApp(RAgency());
}
