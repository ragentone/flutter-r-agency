import 'package:app/bootstrap/bootstrap.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class GraphqlProvider extends ChangeNotifier {
  bool isBooted = false;

  void boot(BuildContext context) {
    final bootstrap = context.watch<Bootstrap>();

    if (!bootstrap.isBooted) {
      return;
    }

    isBooted = true;
    notifyListeners();
  }
}
