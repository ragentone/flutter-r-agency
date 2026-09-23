import 'package:app/bootstrap/bootstrap.dart';
import 'package:app/components/page.dart';
import 'package:app/user/auth_state.dart';
import 'package:forui/forui.dart';
import 'package:material_ui/material_ui.dart';
import 'package:provider/provider.dart';

class PageHome extends StatefulWidget {
  const PageHome({super.key});

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bootstrap = context.watch<Bootstrap>();

    return DefaultPage(
      body: ValueListenableBuilder(
        valueListenable: AuthState.userMate,
        builder: (ctx, value, child) {
          if (value == null) {
            return Center(
              child: FButton(
                onPress: () {
                  bootstrap.userAuthService.login(
                    'admin@r-agency.org',
                    '#Nesoqoke001',
                  );
                },
                child: Text('Login'),
              ),
            );
          }

          return Center(
            child: FButton(
              onPress: () {
                //bootstrap.userAuthService.logout();
                bootstrap.websocket
                    .payload()
                    .controller('developer')
                    .action(
                      'test',
                      data: {},
                      onResponse: (response, info) {
                        print(response);
                        print(info.executed);
                        print(info.hrtime);
                        print(info.errors?.first.toString());
                      },
                    )
                    .send();
              },
              child: Text('Logout'),
            ),
          );
        },
      ),
    );
  }
}
