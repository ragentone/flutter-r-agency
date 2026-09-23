import 'package:app/bootstrap/event_bus_service.dart';
import 'package:app/config/config_response.dart';
import 'package:app/config/config_service.dart';
import 'package:app/graphql/client/graphql_factory.dart';
import 'package:app/router/router.dart';
import 'package:app/user/services/user_auth_service.dart';
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
  UserConfigService userConfigService = UserConfigService();
  UserAuthService userAuthService = UserAuthService();
  Websocket websocket = Websocket();
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
      await configService.loadEnv();
      config = await configService.load();

      graphQlFactory.boot(config!);

      websocket.boot(config!);

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
}
