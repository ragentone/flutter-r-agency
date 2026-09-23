import 'package:shared_preferences/shared_preferences.dart';

class AuthToken {
  final String _key = 'app_user_auth_token';
  final String _emptyToken = '_xxx_xxx_xxx_xxx_xxx_xxx_';

  Future<String> get() async {
    final storage = await SharedPreferences.getInstance();
    return storage.getString(_key) ?? _emptyToken;
  }

  Future<void> set(String token) async {
    final storage = await SharedPreferences.getInstance();
    storage.setString(_key, token);
  }

  Future<void> destroy() async {
    final storage = await SharedPreferences.getInstance();
    await storage.remove(_key);
  }
}
