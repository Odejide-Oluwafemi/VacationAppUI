import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme with ChangeNotifier {
  TextStyle _titleMedium = TextStyle(
    fontSize: 26,
    color: Colors.black87,
    fontWeight: FontWeight.bold,
  );

  TextStyle _titleSmall = TextStyle(
    fontSize: 18,
    color: Colors.grey,
  );

  TextStyle _displaySmall = TextStyle(fontSize: 14, color: Colors.grey);

  late final ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.cyan,
    fontFamily: GoogleFonts.gelasio().fontFamily,
    textTheme: TextTheme(
      titleMedium: _titleMedium,
      titleSmall: _titleSmall,
      displaySmall: _displaySmall,
    ),
  );

  late final ThemeData darkTheme = ThemeData(
    canvasColor: Colors.black,
    fontFamily: GoogleFonts.gelasio().fontFamily,
    textTheme: TextTheme(
      titleMedium: _titleMedium.copyWith(color: Colors.white),
      titleSmall: _titleSmall.copyWith(color: Colors.white.withOpacity(0.8)),
      displaySmall:
          _displaySmall.copyWith(color: Colors.white.withOpacity(0.8)),
    ),
  );

  bool _isDark = false;
  bool get isDark => _isDark;

  ThemeMode themeMode() {
    return _isDark ? ThemeMode.dark : ThemeMode.light;
  }

  switchTheme() {
    _isDark = !_isDark;
    notifyListeners();
  }

  setThemeMode(ThemeMode mode) {
    if (mode == ThemeMode.light) {
      _isDark = false;
    } else {
      _isDark = true;
    }
    notifyListeners();
  }
}
