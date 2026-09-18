import 'package:app/user/const.dart';
import 'package:app/user/services/user_auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';

class UserLoginForm extends StatefulWidget {
  const UserLoginForm({super.key});

  @override
  State<StatefulWidget> createState() => UserLoginFormState();
}

class UserLoginFormState extends State<UserLoginForm> {
  final emailCtrl = TextEditingController(text: 'admin@r-agency.org');
  final passwordCtrl = TextEditingController(text: '#Nesoqoke001');
  final ValueNotifier<bool> busy = ValueNotifier(false);

  void _submit(BuildContext context) async {
    if (busy.value) return;
    busy.value = true;
    await UserAuthService.login(emailCtrl.text, passwordCtrl.text, (success) {
      if (!success) return;
      context.go(routePathUserAfterLogin);
    });
    busy.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FCard(
          builder: (context, style, _) {
            return Padding(
              padding: style.padding,
              child: Column(
                mainAxisSize: .min,
                crossAxisAlignment: .start,
                children: [
                  Text('Login Form', style: style.titleTextStyle),
                  const SizedBox(height: 6),
                  ValueListenableBuilder(
                    valueListenable: busy,
                    builder: (ctx, value, child) {
                      return FTextFormField.email(
                        label: const Text('Email-Address'),
                        description: Text('Enter valid email-address'),
                        control: FTextFieldControl.managed(
                          controller: emailCtrl,
                        ),
                        enabled: !value,
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  ValueListenableBuilder(
                    valueListenable: busy,
                    builder: (ctx, value, child) {
                      return FTextFormField.password(
                        label: Text('Password'),
                        control: FTextFieldControl.managed(
                          controller: passwordCtrl,
                        ),
                        enabled: !value,
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  ValueListenableBuilder(
                    valueListenable: busy,
                    builder: (ctx, value, child) {
                      return FButton(
                        onPress: () => _submit(context),
                        child: value
                            ? FCircularProgress.loader()
                            : const Text('Login'),
                      );
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
