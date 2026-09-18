import 'package:app/user/components/user_card.dart';
import 'package:app/user/const.dart';
import 'package:app/user/dialogs/dialog_user_logout_confirm.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<StatefulWidget> createState() => MainMenuState();
}

class MainMenuState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    return FHeaderAction(
      icon: Icon(FLucideIcons.menu),
      onPress: () {
        showFSheet(
          context: context,
          builder: (ctx) => DecoratedBox(
            decoration: BoxDecoration(color: ctx.theme.colors.background),
            child: FSidebar(
              header: UserCard(),
              children: [
                FSidebarGroup(
                  children: [
                    FSidebarItem(
                      icon: Icon(FLucideIcons.user),
                      label: Text('Home'),
                      onPress: () => context.go('/'),
                    ),
                  ],
                ),
                FSidebarGroup(
                  children: [
                    FSidebarItem(
                      label: Text('Login'),
                      onPress: () => {context.go(routePathUserAuth)},
                    ),
                    FSidebarItem(
                      label: Text('Logout'),
                      onPress: () => {
                        showDialog(
                          context: context,
                          builder: (ctx) => DialogUserLogoutConfirm.create(ctx),
                        ),
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          side: FLayout.ltr,
        );
      },
    );
  }
}
