import 'package:flutter/cupertino.dart';

class ConfigProvider extends ChangeNotifier {
  bool loaded = false;

  Future<void> load() async {
    const Duration(seconds: 100);
    loaded = true;
    notifyListeners();
  }
}
