import 'package:app/components/menu.dart';
import 'package:forui/forui.dart';
import 'package:material_ui/material_ui.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<StatefulWidget> createState() => HeaderState();
}

class HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FHeader.nested(
          title: Text(
            'r-agency',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: FTypeface.defaultFontFamily,
            ),
          ),
          titleAlignment: AlignmentGeometry.centerLeft,
          prefixes: [const MainMenu()],
          suffixes: [],
        ),
        FDivider(
          style: FDividerStyle(
            color: context.theme.colors.border,
            padding: EdgeInsets.all(0),
          ),
        ),
      ],
    );
  }
}
