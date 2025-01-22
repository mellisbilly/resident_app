import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart' as gl_toolkit;

import 'pump_app.dart';

Future<void> loadImages(
  WidgetTester tester, {
  bool animated = false,
}) async {
  final images = find.byType(Image).evaluate().toList();
  for (final element in images) {
    final widget = element.widget as Image;
    final image = widget.image;
    await tester.runAsync(() async {
      await precacheImage(image, element);
    });
    animated
        ? await tester.pump(const Duration(seconds: 1))
        : await tester.pumpAndSettle();
  }
}

extension GoldenTests on WidgetTester {
  Future<void> golden(Widget widget, String filename) async {
    final location = 'goldens/$filename';
    final binding =
        TestWidgetsFlutterBinding.ensureInitialized();

    await binding.setSurfaceSize(const Size(320, 652));
    await gl_toolkit.loadAppFonts();

    platformDispatcher.textScaleFactorTestValue = 1.0;

    await pumpApp(
      widget,
    );

    // Loads images for initial golden
    await loadImages(this);

    await expectLater(
      find.byType(MaterialApp),
      matchesGoldenFile(
        '$location.png',
      ),
    );
    //needed for dark mode to be enabled
    await pumpWidget(Container());

    await pumpApp(
      themeMode: ThemeMode.dark,
      widget,
    );
    await expectLater(
      find.byType(MaterialApp),
      matchesGoldenFile(
        '${location}_dark.png',
      ),
    );

    await pumpWidget(Container());
    platformDispatcher.textScaleFactorTestValue = 2.0;

    await pumpApp(
      widget,
    );
    await expectLater(
      find.byType(MaterialApp),
      matchesGoldenFile(
        '${location}_accessibility.png',
      ),
    );
  }
}
