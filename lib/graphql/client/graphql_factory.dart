import 'package:app/config/config_response.dart';
import 'package:app/device/device_id.dart';
import 'package:app/user/auth_token.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQlFactory {
  static final DeviceId _deviceId = DeviceId();
  static final AuthToken _authToken = AuthToken();
  static late ConfigResponse _config;

  void boot(ConfigResponse config) {
    _config = config;
  }

  Future<GraphQLClient> create() async {
    final httpLink = HttpLink(
      _config.config.graphql.url,
      defaultHeaders: {
        'x-device-id': await _deviceId.get(),
        'x-auth-token': await _authToken.get(),
      },
    );
    final cache = GraphQLCache(store: InMemoryStore());

    final ErrorLink errorLink = ErrorLink(
      onException: (request, forward, exception) {
        print('GraphQL Error: $exception');
        forward(request);
        return null;
      },
      onGraphQLError: (request, forward, exception) {
        print('GraphQL Error: $exception');
        forward(request);
        return null;
      },
    );

    final link = Link.from([errorLink, httpLink]);

    return GraphQLClient(
      link: link,
      cache: cache,
      defaultPolicies: DefaultPolicies(
        query: Policies(fetch: FetchPolicy.cacheAndNetwork),
        mutate: Policies(fetch: FetchPolicy.networkOnly),
      ),
    );
  }
}
