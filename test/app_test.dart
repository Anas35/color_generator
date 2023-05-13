import 'package:color_generator/app.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const String textContent = 'Hello there!';

  testWidgets('Check text is in center', (WidgetTester tester) async {
    // screen size
    const screenSize = Size.square(500.0);
    const two = 2;
    // set the WidgetTester screen size
    await tester.binding.setSurfaceSize(screenSize);

    // Build app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(home: App()));

    // Verify that text exist
    final findText = find.text(textContent);
    expect(findText, findsOneWidget);

    // fetch the center position of text
    final textRect = tester.getCenter(findText);

    // verify the position matchs with screen size
    expect(textRect.dx, equals(screenSize.width / two));
    expect(textRect.dy, equals(screenSize.height / two));

    // reset the WidgetTester screen size
    addTearDown(() => tester.binding.setSurfaceSize(null));
  });

  testWidgets('Trigger Color change when tap', (WidgetTester tester) async {
    // Build app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(home: App()));

    // Verify that text exist
    expect(find.text(textContent), findsOneWidget);

    // save the current scaffold instance
    final oldScaffold = tester.widget(find.byType(Scaffold)) as Scaffold;

    // Tap on text
    await tester.tap(find.text(textContent));
    await tester.pump();

    // save the new scaffold instance
    final newScaffold = tester.widget(find.byType(Scaffold)) as Scaffold;

    // Verify that new and old scaffold's background are not same.
    expect(oldScaffold.backgroundColor, isNot(newScaffold.backgroundColor));
  });

  testWidgets('Trigger Color change with enter key',
      (WidgetTester tester) async {
    // Build app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(home: App()));

    // Verify that text exist
    expect(find.text(textContent), findsOneWidget);
    // save the current scaffold instance
    final oldScaffold = tester.widget(find.byType(Scaffold)) as Scaffold;

    // Logical Tap the enter key.
    await tester.sendKeyEvent(LogicalKeyboardKey.enter);
    await tester.pump();

    // save the current scaffold instance
    final newScaffold = tester.widget(find.byType(Scaffold)) as Scaffold;

    // Verify that new and old scaffold's background are not same.
    expect(oldScaffold.backgroundColor, isNot(newScaffold.backgroundColor));
  });
}
