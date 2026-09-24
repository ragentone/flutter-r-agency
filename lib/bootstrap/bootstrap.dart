import 'package:app/bootstrap/event_bus_service.dart';
import 'package:app/config/config_response.dart';
import 'package:app/config/config_service.dart';
import 'package:app/graphql/client/graphql_factory.dart';
import 'package:app/phone/phone_service.dart';
import 'package:app/router/const.dart';
import 'package:app/router/router.dart';
import 'package:app/theme/theme_service.dart';
import 'package:app/user/services/user_config_service.dart';
import 'package:app/websocket/websocket.dart';
import 'package:flutter/foundation.dart';

class BootstrapBootedEvent {
  late final ConfigResponse config;

  BootstrapBootedEvent({required this.config});
}

class Bootstrap extends ChangeNotifier {
  ConfigService configService = ConfigService();
  EventBusService eventBusService = EventBusService();
  GraphQlFactory graphQlFactory = GraphQlFactory();
  ThemeService themeService = ThemeService();
  UserConfigService userConfigService = UserConfigService();
  Websocket websocket = Websocket();
  PhoneService phoneService = PhoneService();
  Router router = Router();

  /// variables
  ConfigResponse? config;

  bool isBooted = false;
  bool hasError = false;

  String? error;

  Bootstrap();

  Future<void> boot() async {
    isBooted = false;
    error = null;
    notifyListeners();

    try {
      await themeService.load();

      await configService.loadEnv();
      config = await configService.load();

      graphQlFactory.boot(config!);

      websocket.boot(config!);

      await phoneService.boot(config!, websocket);

      await userConfigService.load();

      await router.boot();

      await Future.delayed(Duration(seconds: 1));

      isBooted = true;
      notifyListeners();
    } catch (e) {
      hasError = true;
      error = e.toString();
    } finally {
      notifyListeners();
    }
  }

  void goHome() {
    go(routePathHome);
  }

  void go(String path) {
    if (router.instance.state.path == path) {
      return;
    }
    router.instance.go(path);
  }
}
