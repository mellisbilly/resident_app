import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:resident_app/app/theme/theme.dart';
import 'package:resident_app/l10n/l10n.dart';

// This file contains a helper extension on WidgetTester that allows us to pump a widget with our needed repositories.
extension PumpApp on WidgetTester {
  Future<void> pumpApp(
    Widget widget, {
    ThemeMode? themeMode = ThemeMode.light,
  }) async {
    return pumpWidget(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        themeMode: themeMode,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        home: Scaffold(body: widget),
      ),
    );
  }
}
