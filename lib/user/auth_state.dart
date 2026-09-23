import 'package:app/user/types.dart';
import 'package:flutter/cupertino.dart';

class AuthState {
  static ValueNotifier userMate = ValueNotifier<UserMetaData?>(null);
  static ValueNotifier isAuthorized = ValueNotifier<bool>(false);

  Future<void> destroy() async {
    isAuthorized.value = false;
    userMate.value = null;
  }

  Future<void> setUserMeta(UserMetaData meat) async {
    userMate.value = meat;
    isAuthorized.value = true;
  }
}
