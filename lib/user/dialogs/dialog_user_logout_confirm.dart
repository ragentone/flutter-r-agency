import 'package:app/user/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';

import '../../components/dialogs/dialog_vertical.dart';

class DialogUserLogoutConfirm {
  static DialogVertical create(BuildContext ctx) {
    return DialogVertical(
      title: Text('Confirm logout'),
      body: SingleChildScrollView(
        child: Column(
          spacing: 8.0,
          children: [
            FDivider(),
            Text(
              "You're about to end your current session and sign out of your account on this device. Once you log out, you'll no longer be able to access your account, saved preferences, or any personalized content until you sign back in.",
            ),
            Text(
              "If you have any unsaved changes—such as drafts, form entries, or work in progress—they may be lost when you log out. Be sure to save anything important before continuing.",
            ),
            Text(
              "Logging out is a good idea if you're using a shared or public device, or if you simply want to keep your account secure from others who may have access to this device.",
            ),
            Text(
              "You can always sign back in at any time using your username and password. Your data and settings will be waiting for you when you return.",
            ),
          ],
        ),
      ),
      actions: [
        FButton(
          onPress: () {
            Navigator.of(ctx).pop();
            ctx.go(routePathUserLogout);
          },
          child: Text('Confirm'),
        ),
        FButton(
          onPress: () {
            Navigator.of(ctx).pop();
          },
          variant: .destructive,
          child: Text('Abort'),
        ),
      ],
    );
  }
}
