import 'package:app/user/services/user_auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:forui/forui.dart';

class UserLogoutButton extends StatefulWidget {
  const UserLogoutButton({super.key});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<UserLogoutButton> {
  final UserAuthService service = UserAuthService();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: service.isBusy,
      builder: (ctx, value, child) {
        return FButton(
          onPress: value ? null : () => service.logout(),
          child: Row(
            spacing: 6.0,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Logout'),
              value ? FCircularProgress() : SizedBox(),
            ],
          ),
        );
      },
    );
  }
}
