import 'package:flutter/material.dart';
import 'package:masakan_ala_anak_kos/helper/storage_manager.dart';

final ThemeData _kLightTheme = ThemeData.light().copyWith(
  primaryColor: Colors.teal,
  textTheme: ThemeData.light().textTheme.apply(fontFamily: 'Newsreader'),
  accentTextTheme:
      ThemeData.light().accentTextTheme.apply(fontFamily: 'Newsreader'),
  primaryTextTheme:
      ThemeData.light().primaryTextTheme.apply(fontFamily: 'Newsreader'),
);

final ThemeData _kDarkTheme = ThemeData.dark().copyWith(
  primaryColor: Colors.indigo,
  textTheme: ThemeData.dark().textTheme.apply(fontFamily: 'Newsreader'),
  accentTextTheme:
      ThemeData.dark().accentTextTheme.apply(fontFamily: 'Newsreader'),
  primaryTextTheme:
      ThemeData.dark().primaryTextTheme.apply(fontFamily: 'Newsreader'),
);

class ThemeNotifier with ChangeNotifier {
  final String key = 'isDarkTheme';
  ThemeData _theme = _kLightTheme;
  ThemeData get getTheme => _theme;
  bool _isDark = false;
  bool get isDark => _isDark;

  ThemeNotifier() {
    _initTheme();
  }

  void _initTheme() async {
    bool? value = await StorageManager.readPrefs(key);
    _isDark = value ?? false;
    _isDark ? _setDarkTheme() : _setLightTheme();
  }

  void _setLightTheme() {
    _theme = _kLightTheme;
    StorageManager.savePrefs(key, false);
    notifyListeners();
  }

  void _setDarkTheme() {
    _theme = _kDarkTheme;
    StorageManager.savePrefs(key, true);
    notifyListeners();
  }

  void swapTheme() {
    _isDark = !_isDark;
    _isDark ? _setDarkTheme() : _setLightTheme();
  }
}
