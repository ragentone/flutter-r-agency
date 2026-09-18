import 'package:app/user/services/user_auth_service.dart';
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
      onChange: (index) {},
      children: [
        FBottomNavigationBarItem(icon: Icon(FLucideIcons.home, size: 18)),
        ValueListenableBuilder(
          valueListenable: UserAuthService.meta,
          builder: (context, value, child) {
            return value == null
                ? FBottomNavigationBarItem(
                    icon: Icon(FLucideIcons.logIn, size: 18),
                  )
                : FBottomNavigationBarItem(
                    icon: Icon(FLucideIcons.user, size: 18),
                  );
          },
        ),
      ],
    );
  }
}
