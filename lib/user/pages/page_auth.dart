import 'package:app/components/page.dart';
import 'package:app/user/components/user_login_form.dart';
import 'package:flutter/cupertino.dart';

class PageAuth extends StatefulWidget {
  const PageAuth({super.key});

  @override
  State<StatefulWidget> createState() => PageAuthState();
}

class PageAuthState extends State<PageAuth> {
  @override
  Widget build(BuildContext context) {
    return DefaultPage(body: Column(children: [UserLoginForm()]));
  }
}
