import 'package:app/config/config_manager.dart';
import 'package:app/device/device_id.dart';
import 'package:app/user/services/user_auth_service.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQlFactory {
  static Future<GraphQLClient> create() async {
    final config = ConfigManager.config;

    final httpLink = HttpLink(
      config?.config.graphql.url ?? 'http://localhost:5000/graphl',
      defaultHeaders: {
        'x-device-id': await DeviceIdManager.getOrCreateDeviceId(),
        'x-auth-token': ?await UserAuthService.getAuthToken(),
      },
    );
    final cache = GraphQLCache(store: InMemoryStore());

    return GraphQLClient(
      link: httpLink,
      cache: cache,
      defaultPolicies: DefaultPolicies(
        query: Policies(fetch: FetchPolicy.cacheAndNetwork),
        mutate: Policies(fetch: FetchPolicy.networkOnly),
      ),
    );
  }
}
