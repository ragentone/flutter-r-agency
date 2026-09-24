import 'package:app/bootstrap/bootstrap.dart';
import 'package:app/theme/theme_toggle_button.dart';
import 'package:app/user/auth_state.dart';
import 'package:app/user/const.dart';
import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:provider/provider.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<Header> {
  final AuthState authState = AuthState();

  @override
  Widget build(BuildContext context) {
    final bootstrap = context.read<Bootstrap>();

    return Column(
      children: [
        FHeader.nested(
          title: GestureDetector(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'r-agency',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Development',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            onTap: () => bootstrap.goHome(),
          ),
          titleAlignment: .centerLeft,
          prefixes: [
            GestureDetector(
              child: Image.asset('assets/images/logo.png', width: 32.0),
              onTap: () => bootstrap.goHome(),
            ),
          ],
          suffixes: [
            const ThemeToggleButton(),
            ValueListenableBuilder(
              valueListenable: AuthState.userMate,
              builder: (ctx, value, child) {
                if (value == null) {
                  return FHeaderAction(
                    icon: Icon(FLucideIcons.logIn, size: 18),
                    onPress: () {
                      bootstrap.go(routePathUserAuth);
                    },
                  );
                }

                return FHeaderAction(
                  icon: const Icon(FLucideIcons.user, size: 18),
                  onPress: () {},
                );
              },
            ),
          ],
        ),
        Divider(height: 1, color: context.theme.colors.border),
      ],
    );
  }
}
