import 'package:shared_preferences/shared_preferences.dart';

class StorageManager {
  static void savePrefs(String key, dynamic value) async {
    final prefs = await SharedPreferences.getInstance();
    if (value is List<String>) {
      prefs.setStringList(key, value);
    } else if (value is String) {
      prefs.setString(key, value);
    } else if (value is int) {
      prefs.setInt(key, value);
    } else if (value is double) {
      prefs.setDouble(key, value);
    } else if (value is bool) {
      prefs.setBool(key, value);
    } else {
      throw Exception("Invalid value type");
    }
  }

  static Future<dynamic> readPrefs(String key) async {
    final prefs = await SharedPreferences.getInstance();
    dynamic value = prefs.get(key);
    return value;
  }

  static Future<bool> deletePrefs(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }
}
