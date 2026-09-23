import 'package:app/bootstrap/bootstrap.dart';
import 'package:app/pages/page_home.dart';
import 'package:app/user/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:forui/forui.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('PageHome renders login button when user is not logged in', (tester) async {
    AuthState.userMate.value = null;
    final bootstrap = Bootstrap();

    await tester.pumpWidget(
      ChangeNotifierProvider<Bootstrap>.value(
        value: bootstrap,
        child: MaterialApp(
          builder: (context, child) => FTheme(
            data: FTheme.neutral.light.touch,
            child: child ?? const SizedBox.shrink(),
          ),
          home: const PageHome(),
        ),
      ),
    );

    expect(find.text('Login'), findsOneWidget);
  });
}
