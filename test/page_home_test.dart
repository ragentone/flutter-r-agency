import 'package:app/pages/page_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:forui/forui.dart';

void main() {
  testWidgets('PageHome updates text reactively on button press', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        builder: (context, child) => FTheme(
          data: FTheme.neutral.light.touch,
          child: child ?? const SizedBox.shrink(),
        ),
        home: const PageHome(),
      ),
    );

    expect(find.text('_value'), findsOneWidget);
    expect(find.text('Eugen Becker'), findsNothing);

    await tester.tap(find.byType(FButton));
    await tester.pumpAndSettle();

    expect(find.text('Eugen Becker'), findsOneWidget);
    expect(find.text('_value'), findsNothing);
  });
}
