import 'package:app/generated/schema.graphql.dart';
import 'package:app/graphql/client/graphql_factory.dart';
import 'package:app/graphql/generated/user_config.graphql.dart';
import 'package:app/graphql/generated/user_login.graphql.dart';
import 'package:app/graphql/generated/user_logout.graphql.dart';
import 'package:app/user/types.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AuthStatus { unknown, authenticated, unauthenticated }

class UserAuthService {
  static ValueNotifier<AuthStatus> status = ValueNotifier(AuthStatus.unknown);
  static ValueNotifier<UserMetaData?> meta = ValueNotifier(null);
  static ValueNotifier<String?> authToken = ValueNotifier(null);
  static late SharedPreferences _store;
  static bool _ready = false;

  static final _authTokenKey = 'user-auth-token-key';

  static Future<void> build() async {
    _store = await SharedPreferences.getInstance();
    _ready = true;
  }

  static Future<bool> load() async {
    final client = await GraphQlFactory.create();
    final result = await client.query$UserConfig();

    final data = result.parsedData?.userLoadConfig;
    final bool authorized = data?.authorized ?? false;
    final String? token = data?.refreshToken;

    if (data == null) {
      status.value = AuthStatus.unauthenticated;
      return false;
    }

    if (token != null) {
      authToken.value = token;
      _store.setString(_authTokenKey, token);
    } else {
      authToken.value = null;
      _store.remove(_authTokenKey);
    }

    if (authorized && data.meta != null) {
      status.value = AuthStatus.authenticated;
      meta.value = data.meta;
    } else {
      status.value = AuthStatus.unauthenticated;
      meta.value = null;
    }
    return true;
  }

  static Future<bool> login(
    String email,
    String password,
    Function(bool success) callback,
  ) async {
    final client = await GraphQlFactory.create();

    final result = await client.mutate$UserLogin(
      Options$Mutation$UserLogin(
        variables: Variables$Mutation$UserLogin(
          params: Input$userLoginParams(email: email, password: password),
        ),
      ),
    );

    final success = result.parsedData?.userLogin?.success ?? false;
    final token = result.parsedData?.userLogin?.authToken;

    if (success && token != null) {
      _store.setString(_authTokenKey, token);
      authToken.value = token;
      await load();
    }

    callback(success);

    return success;
  }

  static Future<bool> logout() async {
    final client = await GraphQlFactory.create();
    final result = await client.query$UserLogout();

    final bool success = result.parsedData?.userLogout?.success ?? false;

    if (success) {
      destroy();
    }

    return success;
  }

  static bool isAuthorized() {
    return status.value == AuthStatus.authenticated;
  }

  static bool isReady() {
    return _ready;
  }

  static void destroy() async {
    _store.remove(_authTokenKey);
    status.value = AuthStatus.unauthenticated;
    authToken.value = null;
    meta.value = null;
  }

  static Future<String?> getAuthToken() async {
    return _store.getString(_authTokenKey);
  }
}

final userAuthService = UserAuthService();
