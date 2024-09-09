import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../theme/app_theme.dart';

class ThemeProvider extends ChangeNotifier {


  ThemeData selectedTheme = AppTheme.lightTheme;

  bool isDarkModeEnable() {
    return selectedTheme == AppTheme.darkTheme;
  }


  void changeTheme(ThemeData theme) async {
    if (theme == selectedTheme) {
      return;
    }
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('theme', theme == AppTheme.lightTheme);
    selectedTheme = theme;
    notifyListeners();
  }

  void getTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool theme = prefs.getBool("theme") ?? true;
    changeTheme(theme?AppTheme.lightTheme:AppTheme.darkTheme);
  }
}