import 'package:app/components/page.dart';
import 'package:app/user/services/user_auth_service.dart';
import 'package:flutter/cupertino.dart';

class PageLogout extends StatefulWidget {
  const PageLogout({super.key});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<PageLogout> {
  @override
  Widget build(BuildContext context) {
    UserAuthService.logout();
    return DefaultPage(body: Column());
  }
}
