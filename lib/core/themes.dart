import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.dark; // Varsayılan olarak gece modu

  ThemeMode get themeMode => _themeMode;

  ThemeProvider() {
    _loadTheme(); // Kaydedilmiş temayı yükler
  }

  void toggleTheme(bool isDark) async {
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', isDark);
  }

  void _loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isDark = prefs.getBool('isDarkMode');
    if (isDark != null) {
      _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
      notifyListeners();
    }
  }

  ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: const Color.fromARGB(255, 255, 255, 255),
      scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 18),
        bodyMedium:
            TextStyle(color: Color.fromARGB(221, 0, 0, 0), fontSize: 16),
        titleLarge: TextStyle(
            color: Color.fromARGB(255, 247, 77, 4),
            fontSize: 22,
            fontWeight: FontWeight.bold),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color.fromARGB(255, 5, 210, 128),
        foregroundColor: Color.fromARGB(255, 255, 68, 0),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color.fromARGB(255, 5, 210, 128),
        selectedItemColor: Color.fromARGB(255, 198, 71, 3),
        unselectedItemColor: Color.fromARGB(255, 0, 0, 0),
      ),
    );
  }

  ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.blue,
      scaffoldBackgroundColor: Color.fromARGB(255, 18, 18, 18),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.white, fontSize: 18),
        bodyMedium: TextStyle(color: Colors.white70, fontSize: 16),
        titleLarge: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 22,
            fontWeight: FontWeight.bold),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        foregroundColor: Colors.white,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color.fromARGB(255, 6, 194, 141),
        selectedItemColor: Color.fromARGB(255, 176, 58, 4),
        unselectedItemColor: Color.fromARGB(255, 0, 0, 0),
      ),
    );
  }
}
