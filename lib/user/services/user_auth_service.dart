import 'package:app/generated/schema.graphql.dart';
import 'package:app/graphql/client/graphql_factory.dart';
import 'package:app/graphql/generated/user_login.graphql.dart';
import 'package:app/graphql/generated/user_logout.graphql.dart';
import 'package:app/user/auth_state.dart';
import 'package:app/user/auth_token.dart';
import 'package:app/user/services/user_config_service.dart';
import 'package:flutter/cupertino.dart';

class UserAuthService {
  final AuthToken authToken = AuthToken();
  final AuthState authState = AuthState();
  final UserConfigService configService = UserConfigService();
  final GraphQlFactory _graphQlFactory = GraphQlFactory();

  final ValueNotifier isBusy = ValueNotifier<bool>(false);

  Future<void> login(String email, String password) async {
    if (isBusy.value) {
      return;
    }

    isBusy.value = true;

    final client = await _graphQlFactory.create();
    final params = Input$userLoginParams(email: email, password: password);
    final result = await client.mutate$UserLogin(
      Options$Mutation$UserLogin(
        variables: Variables$Mutation$UserLogin(params: params),
      ),
    );

    final token = result.parsedData?.userLogin?.authToken;

    if (token == null) {
      await authToken.destroy();
    } else {
      await authToken.set(token);
      await configService.load();
    }

    isBusy.value = false;
  }

  Future<void> logout() async {
    if (isBusy.value) {
      return;
    }

    isBusy.value = true;
    final client = await _graphQlFactory.create();
    final result = await client.query$UserLogout();
    final bool success = result.parsedData?.userLogout?.success ?? false;

    if (success) {
      await authState.destroy();
      await authToken.destroy();
    }

    isBusy.value = false;
  }
}
