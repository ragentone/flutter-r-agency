import 'package:app/components/page.dart';
import 'package:app/user/logout/user_logout_button.dart';
import 'package:flutter/cupertino.dart';

class PageUserAccount extends StatefulWidget {
  const PageUserAccount({super.key});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<PageUserAccount> {
  @override
  Widget build(BuildContext context) {
    return DefaultPage(body: Column(children: [UserLogoutButton()]));
  }
}
