import 'package:shared_preferences/shared_preferences.dart';

class AuthToken {
  final String _key = 'app_user_auth_token';

  Future<String> get() async {
    final storage = await SharedPreferences.getInstance();
    return storage.getString(_key) ?? '_xxx_xxx_xxx_xxx_';
  }

  Future<void> set(String token) async {
    final storage = await SharedPreferences.getInstance();
    storage.setString(_key, token);
  }
}
