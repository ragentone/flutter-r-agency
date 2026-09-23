import 'package:app/components/page.dart';
import 'package:app/user/login/user_login_form.dart';
import 'package:flutter/cupertino.dart';

class PageUserAuth extends StatefulWidget {
  const PageUserAuth({super.key});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<PageUserAuth> {
  @override
  Widget build(BuildContext context) {
    return DefaultPage(body: Center(child: UserLoginForm()));
  }
}
