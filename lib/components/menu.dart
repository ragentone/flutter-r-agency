import 'package:forui/forui.dart';
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
            child: FSidebar(children: [FSidebarGroup(children: [])]),
          ),
          side: FLayout.ltr,
        );
      },
    );
  }
}
