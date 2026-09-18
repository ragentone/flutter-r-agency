import 'package:flutter/cupertino.dart';

class Aware {
  static late BuildContext context;

  static void setContext(BuildContext $context) {
    context = $context;
  }
}
