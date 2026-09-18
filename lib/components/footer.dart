import 'package:flutter/cupertino.dart';
import 'package:forui/forui.dart';

class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  State<StatefulWidget> createState() => FooterState();
}

class FooterState extends State<Footer> {
  @override
  Widget build(BuildContext context) {
    return FBottomNavigationBar(
      onChange: (index) {
        showFSheet(
          context: context,
          onClosing: () {},
          builder: (ctx) {
            return Container(
              decoration: BoxDecoration(color: context.theme.colors.background),
              height: .infinity,
              width: .infinity,
            );
          },
          side: FLayout.btt,
        );
      },
      children: [
        FBottomNavigationBarItem(icon: Icon(FLucideIcons.user, size: 18)),
      ],
    );
  }
}
