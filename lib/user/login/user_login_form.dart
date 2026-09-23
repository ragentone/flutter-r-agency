import 'package:app/bootstrap/bootstrap.dart';
import 'package:app/theme/const.dart';
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
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  Future<void> _submit(BuildContext context) async {
    final bool valid = _form.currentState?.validate() ?? false;
    if (!valid) return;
    context.read<Bootstrap>().userAuthService.login(
      _email.text,
      _password.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FCard(
      child: Padding(
        padding: EdgeInsets.all(themeDefaultPadding),
        child: Form(
          key: _form,
          child: Column(
            children: [
              FTextFormField.email(
                label: Text('Email - Address'),
                control: FTextFieldControl.managed(controller: _email),
              ),
              const SizedBox(height: 10),
              FTextFormField.password(
                label: Text('Password'),
                control: FTextFieldControl.managed(controller: _password),
              ),
              FDivider(),
              FButton(
                onPress: () {
                  _submit(context);
                },
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
