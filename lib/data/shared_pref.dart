import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static late SharedPreferences _sharedPreferences;

  static Future initialize() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<void> setString(String key, String value) async {
    await _sharedPreferences.setString(key, value);
  }

  static Future<String?> getString(String key) async {
    return _sharedPreferences.getString(key);
  }

  static Future<void> setInt(String key, int value) async {
    await _sharedPreferences.setInt(key, value);
  }

  static Future<int?> getInt(String key) async {
    return _sharedPreferences.getInt(key);
  }

  static Future<void> setBool(String key, bool value) async {
    await _sharedPreferences.setBool(key, value);
  }

  static Future<bool?> getBool(String key) async {
    return _sharedPreferences.getBool(key);
  }
}
