import 'package:app/config/config_response.dart';
import 'package:app/config/config_service.dart';
import 'package:app/graphql/client/graphql_factory.dart';
import 'package:app/user/services/user_config_service.dart';
import 'package:app/user/types.dart';
import 'package:flutter/foundation.dart';

class Bootstrap extends ChangeNotifier {
  ConfigService configService = ConfigService();
  UserConfigService userConfigService = UserConfigService();
  GraphQlFactory graphQlFactory = GraphQlFactory();

  UserMetaData? userMetaData;

  /// variables
  late String deviceId;
  ConfigResponse? config;
  bool isLoading = false;
  bool isBooted = false;
  bool hasError = false;
  String? error;

  Bootstrap();

  Future<void> boot() async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      await configService.loadEnv();
      config = await configService.load();

      graphQlFactory.boot(config!);

      await userConfigService.load();

      isBooted = true;
    } catch (e) {
      hasError = true;
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
