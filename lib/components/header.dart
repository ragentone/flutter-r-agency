import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FHeader.nested(
          title: Text('r-agency', style: TextStyle(fontSize: 18)),
          titleAlignment: .centerLeft,
          prefixes: [Image.asset('assets/images/logo.png', width: 32.0)],
          suffixes: [
            FHeaderAction(
              icon: const Icon(FLucideIcons.alarmClock, size: 18),
              onPress: () {},
            ),
            FHeaderAction(
              icon: const Icon(FLucideIcons.plus, size: 18),
              onPress: () {},
            ),
          ],
        ),
        Divider(height: 1, color: context.theme.colors.border),
      ],
    );
  }
}
