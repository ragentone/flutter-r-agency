import 'package:app/bootstrap/bootstrap.dart';
import 'package:app/components/page.dart';
import 'package:flutter/cupertino.dart';
import 'package:forui/forui.dart';
import 'package:provider/provider.dart';

class PageUserAuth extends StatefulWidget {
  const PageUserAuth({super.key});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<PageUserAuth> {
  @override
  Widget build(BuildContext context) {
    final bootstrap = context.read<Bootstrap>();
    return DefaultPage(
      body: Center(
        child: FButton(
          onPress: () {
            bootstrap.userAuthService.login(
              'admin@r-agency.org',
              '#Nesoqoke001',
            );
          },
          child: Text('Login'),
        ),
      ),
    );
  }
}
