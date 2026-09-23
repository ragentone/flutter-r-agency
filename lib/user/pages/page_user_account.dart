import 'package:app/components/page.dart';
import 'package:app/user/services/user_auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:forui/forui.dart';

class PageUserAccount extends StatefulWidget {
  const PageUserAccount({super.key});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<PageUserAccount> {
  final UserAuthService authService = UserAuthService();

  @override
  Widget build(BuildContext context) {
    return DefaultPage(
      body: Column(
        children: [
          FButton(
            onPress: () {
              authService.logout();
            },
            child: Text('Logout'),
          ),
        ],
      ),
    );
  }
}
