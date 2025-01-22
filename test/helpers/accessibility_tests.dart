import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'pump_app.dart';

extension AccessibilityTest on WidgetTester {
  Future<void> checkAccessibility(Widget widget) async {
    await binding.setSurfaceSize(const Size(320, 652));
    final handle = ensureSemantics();
    await pumpApp(widget);
    // Checks that tappable nodes have a minimum size of 48 by 48 pixels
    // for Android.
    await expectLater(this, meetsGuideline(androidTapTargetGuideline));
    // Checks that tappable nodes have a minimum size of 44 by 44 pixels
    // for iOS.
    await expectLater(this, meetsGuideline(iOSTapTargetGuideline));
    // Checks that touch targets with a tap or long press action are labeled.
    await expectLater(this, meetsGuideline(labeledTapTargetGuideline));
    // Checks whether semantic nodes meet the minimum text contrast levels.
    // The recommended text contrast is 3:1 for larger text
    // (18 point and above regular).
    await expectLater(this, meetsGuideline(textContrastGuideline));
    handle.dispose();
  }
}
