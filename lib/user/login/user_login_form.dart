import 'package:app/bootstrap/bootstrap.dart';
import 'package:app/theme/const.dart';
import 'package:app/user/services/user_auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:forui/forui.dart';
import 'package:provider/provider.dart';

class UserLoginForm extends StatefulWidget {
  const UserLoginForm({super.key});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<UserLoginForm> {
  final _form = GlobalKey<FormState>();
  final UserAuthService _authService = UserAuthService();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  Future<void> _submit(BuildContext context) async {
    final bool valid = _form.currentState?.validate() ?? false;
    if (!valid) return;
    _authService.login(_email.text, _password.text);
  }

  @override
  Widget build(BuildContext context) {
    return FCard(
      child: Padding(
        padding: EdgeInsets.all(themeDefaultPadding),
        child: ValueListenableBuilder(
          valueListenable: _authService.isBusy,
          builder: (ctx, busy, child) {
            return Form(
              key: _form,
              child: Column(
                children: [
                  FTextFormField.email(
                    label: Text('Email - Address'),
                    control: FTextFieldControl.managed(controller: _email),
                    enabled: !busy,
                  ),
                  const SizedBox(height: 10),
                  FTextFormField.password(
                    label: Text('Password'),
                    control: FTextFieldControl.managed(controller: _password),
                    enabled: !busy,
                  ),
                  FDivider(),
                  FButton(
                    onPress: () {
                      _submit(context);
                    },
                    child: Row(
                      spacing: 6.0,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Login'),
                        busy ? FCircularProgress() : SizedBox(),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
