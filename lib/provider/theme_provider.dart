import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Color(0xff121212),
    primaryColor: Colors.black,
    accentColor: Color(0xffBB86FC),
    cardColor: Color(0xff1E1E1E),
    colorScheme: ColorScheme.dark(),
    iconTheme: IconThemeData(color: Color(0xffBB86FC)),
    shadowColor: Color(0xff615180),
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Color(0xfffafafa),
    primaryColor: Colors.white,
    accentColor: Colors.lightBlueAccent,
    cardColor: Colors.white,
    colorScheme: ColorScheme.light(),
    iconTheme: IconThemeData(color: Colors.lightBlueAccent),
  );
}
