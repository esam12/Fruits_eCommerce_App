import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesSingleton {
  static late SharedPreferences _instance;

  static Future<void> init() async {
    _instance = await SharedPreferences.getInstance();
  }

  static setBool(String key, bool value) {
    _instance.setBool(key, value);
  }

  static getBool(String key) {
    return _instance.getBool(key) ?? false;
  }

  static setString(String key, String value) {
    _instance.setString(key, value);
  }

  static getString(String key) {
    return _instance.getString(key) ?? '';
  }

  static setStringList(String key, List<String> value) {
    _instance.setStringList(key, value);
  }

  static getStringList(String key) {
    return _instance.getStringList(key) ?? [];
  }
}
