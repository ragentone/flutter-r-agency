import 'package:app/graphql/client/graphql_factory.dart';
import 'package:app/graphql/generated/user_config.graphql.dart';
import 'package:app/user/auth_state.dart';
import 'package:app/user/auth_token.dart';

class UserConfigService {
  final AuthToken _authToken = AuthToken();
  final AuthState _authState = AuthState();
  final GraphQlFactory _graphQlFactory = GraphQlFactory();

  Future<void> load() async {
    final client = await _graphQlFactory.create();
    final result = await client.query$UserConfig();
    final userMeta = result.parsedData?.userLoadConfig?.meta;
    final authToken = result.parsedData?.userLoadConfig?.refreshToken;

    if (authToken != null) {
      await _authToken.set(authToken);
    }

    if (userMeta != null) {
      await _authState.setUserMeta(userMeta);
    }

    print(result.data);
  }
}
