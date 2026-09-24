import 'package:app/bootstrap/bootstrap.dart';
import 'package:app/components/page.dart';
import 'package:app/phone/phone_const.dart';
import 'package:app/user/auth_state.dart';
import 'package:app/user/const.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';
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
    return DefaultPage(
      body: ValueListenableBuilder(
        valueListenable: AuthState.userMate,
        builder: (ctx, value, child) {
          if (value == null) {
            return Center(
              child: FButton(
                onPress: () {
                  context.go(routePathUserAuth);
                },
                child: Text('Login'),
              ),
            );
          }

          return Center(
            child: Column(
              children: [
                FButton(
                  onPress: () {
                    context.go(routePathUserAccount);
                  },
                  child: Text('Account'),
                ),
                const SizedBox(height: 8),
                FButton(
                  onPress: () {
                    context.go(routePathPhone);
                  },
                  child: Text('Phone'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
