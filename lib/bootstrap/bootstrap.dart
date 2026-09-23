import 'package:app/bootstrap/event_bus_service.dart';
import 'package:app/config/config_response.dart';
import 'package:app/config/config_service.dart';
import 'package:app/graphql/client/graphql_factory.dart';
import 'package:app/user/services/user_auth_service.dart';
import 'package:app/user/services/user_config_service.dart';
import 'package:app/websocket/websocket_client.dart';
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
  WebsocketClient websocketClient = WebsocketClient();

  /// variables
  ConfigResponse? config;

  ValueNotifier isLoading = ValueNotifier<bool>(false);
  bool isBooted = false;
  bool hasError = false;

  String? error;

  Bootstrap();

  void setLoading(bool loading) {
    isLoading.value = loading;
  }

  Future<void> boot() async {
    isLoading.value = true;
    isBooted = false;
    error = null;
    notifyListeners();

    try {
      await configService.loadEnv();
      config = await configService.load();

      graphQlFactory.boot(config!);
      websocketClient.boot(config!);

      await userConfigService.load();

      await Future.delayed(Duration(seconds: 1));

      eventBusService.bus.fire(BootstrapBootedEvent(config: config!));

      isBooted = true;
      isLoading.value = false;
      notifyListeners();
    } catch (e) {
      hasError = true;
      error = e.toString();
    } finally {
      isLoading.value = false;
      notifyListeners();
    }
  }
}
