import 'package:app/generated/schema.graphql.dart';
import 'package:app/graphql/client/graphql_factory.dart';
import 'package:app/graphql/generated/user_login.graphql.dart';
import 'package:app/user/auth_token.dart';

class UserAuthService {
  final AuthToken authToken = AuthToken();
  final GraphQlFactory _graphQlFactory = GraphQlFactory();

  Future<void> login(String email, String password) async {
    final client = await _graphQlFactory.create();
    final params = Input$userLoginParams(email: email, password: password);
    final result = await client.mutate$UserLogin(
      Options$Mutation$UserLogin(
        variables: Variables$Mutation$UserLogin(params: params),
      ),
    );
    authToken.set(result.parsedData?.userLogin?.authToken ?? '');
  }
}
