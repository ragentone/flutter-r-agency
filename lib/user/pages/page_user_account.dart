import 'package:app/bootstrap/bootstrap.dart';
import 'package:app/components/page.dart';
import 'package:flutter/cupertino.dart';
import 'package:forui/forui.dart';
import 'package:provider/provider.dart';

class PageUserAccount extends StatefulWidget {
  const PageUserAccount({super.key});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<PageUserAccount> {
  @override
  Widget build(BuildContext context) {
    final bootstrap = context.read<Bootstrap>();

    return DefaultPage(
      body: Column(
        children: [
          FButton(
            onPress: () {
              bootstrap.userAuthService.logout();
            },
            child: Text('Logout'),
          ),
        ],
      ),
    );
  }
}
