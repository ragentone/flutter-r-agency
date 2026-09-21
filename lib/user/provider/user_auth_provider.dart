import 'package:app/user/models/user_model.dart';
import 'package:app/user/services/auth_service.dart';
import 'package:flutter/cupertino.dart';

class UserAuthProvider extends ChangeNotifier {
  final AuthService service;
  final UserModel model;

  UserAuthProvider({required this.service, required this.model});

  Future<bool> bootstrap() async {
    final config = await service.loadConfig();

    return true;
  }
}
