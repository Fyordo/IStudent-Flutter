import 'package:flutter/material.dart';

import '../../constants.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;
  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn){
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

}

class MyThemes {
  static final darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.grey.shade600,
      colorScheme: ColorScheme.dark(),
       primaryColor: Constants.hexToColor("#6B3286"),
        bottomAppBarColor: Colors.white30,
      );

  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white, 
      colorScheme: ColorScheme.light(),
      primaryColor: Constants.hexToColor("#6B3286"),
      bottomAppBarColor: Constants.hexToColor("#6B3286", alphaChannel: 'F1'),
      );
}
