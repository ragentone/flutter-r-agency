import 'package:app/graphql/client/graphql_factory.dart';
import 'package:app/graphql/generated/user_config.graphql.dart';

class UserConfigService {
  final GraphQlFactory _graphQlFactory = GraphQlFactory();

  Future<void> load() async {
    final client = await _graphQlFactory.create();
    final result = await client.query$UserConfig();
    print(result.data);
  }
}
