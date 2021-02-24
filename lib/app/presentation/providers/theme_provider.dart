import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:todo_list/constants/colors.dart';
import 'package:todo_list/constants/material_themes.dart';

class ThemeProvider extends ChangeNotifier {
  static ThemeProvider _instance;

  SharedPreferences prefs;
  bool _isDarkMode = false;

  ThemeProvider._(SharedPreferences prefs) {
    if (prefs != null) {
      this.prefs = prefs;
      bool isDarkMode = this.prefs.getBool('isDarkMode') ?? false;
      this.toggleThemeMode(isDarkMode);
    }
  }

  void toggleThemeMode([bool newValue]) async {
    this.isDarkMode = newValue ?? !this.isDarkMode;
    await this.prefs.setBool('isDarkMode', this.isDarkMode);
    notifyListeners();
  }

  ThemeData themeData() {
    return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme: MaterialThemes.appBarTheme(),
      accentColor: TLColors.color(TLColors.primary),
      brightness: this.isDarkMode ? Brightness.dark : Brightness.light,
      backgroundColor: TLColors.color(TLColors.background),
      floatingActionButtonTheme: MaterialThemes.floatingActionButtonTheme(),
      scaffoldBackgroundColor: MaterialThemes.scaffoldBackgroundColor(),
      textTheme: TextTheme(bodyText2: TextStyle()).apply(
        bodyColor: TLColors.color(TLColors.text),
      ),
    );
  }

  static ThemeProvider instance([SharedPreferences prefs]) {
    if (_instance == null) _instance = ThemeProvider._(prefs);
    return _instance;
  }

  bool get isDarkMode => this._isDarkMode;

  set isDarkMode(bool isDarkMode) => this._isDarkMode = isDarkMode;
}
