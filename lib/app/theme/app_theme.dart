import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get light {
    const mainFontColour = Color(0xFF101828);

    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF033754),
        surface: const Color(0xFF033754),
        primary: const Color(0xFFF9FAFB),
      ),
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      textTheme: const TextTheme(
        bodyMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: mainFontColour,
        ),
        bodySmall: TextStyle(
          fontSize: 14,
          color: Color(0xFF667085),
        ),
        titleLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: mainFontColour,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        unselectedIconTheme: IconThemeData(
          color: Color(0xFF94969C),
        ),
        selectedIconTheme: IconThemeData(
          color: Color(0xFF65A8CD),
        ),
      ),
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
    );
  }

  static ThemeData get dark {
    const mainFontColour = Color(0xFFF5F5F6);
    const appBarAndScaffoldColour = Color(0xFF1F242F);

    return ThemeData(
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF161B26),
        primary: const Color(0XFF0C111D),
        surface: const Color(0XFF161B26),
        brightness: Brightness.dark,
      ),
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: 0,
        backgroundColor: appBarAndScaffoldColour,
      ),
      scaffoldBackgroundColor: appBarAndScaffoldColour,
      // Text themes
      textTheme: const TextTheme(
        bodyMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: mainFontColour,
        ),
        bodySmall: TextStyle(
          fontSize: 14,
          color: Color(0xFF667085),
        ),
        titleLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: mainFontColour,
        ),
      ),

      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color(0xFF0C111D),
        unselectedIconTheme: IconThemeData(
          color: Color(0xFF94969C),
        ),
        selectedIconTheme: IconThemeData(
          color: Color(0xFF65A8CD),
        ),
        selectedLabelStyle: TextStyle(
          color: Color(0xFFF5F5F6),
        ),
        unselectedLabelStyle: TextStyle(
          color: Color(0xFFF5F5F6),
        ),
      ),
    );
  }
}
