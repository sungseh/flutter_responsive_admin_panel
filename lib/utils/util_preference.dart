import 'package:flutter_responsive_admin_panel/configs/configs.dart';

class UtilPreferences {
  static Future<bool> clear() {
    return ConfigPreferences.instance!.clear();
  }

  static bool containsKey(String key) {
    return ConfigPreferences.instance!.containsKey(key);
  }

  static Future<void> reload() {
    return ConfigPreferences.instance!.reload();
  }

  static Future<bool> remove(String key) {
    return ConfigPreferences.instance!.remove(key);
  }

  ///////////////
  /// GETTERS ///
  ///////////////
  static dynamic get(String key) {
    return ConfigPreferences.instance!.get(key);
  }

  static bool? getBool(String key) {
    return ConfigPreferences.instance!.getBool(key);
  }

  static double? getDouble(String key) {
    return ConfigPreferences.instance!.getDouble(key);
  }

  static int? getInt(String key) {
    return ConfigPreferences.instance!.getInt(key);
  }

  static Set<String> getKeys() {
    return ConfigPreferences.instance!.getKeys();
  }

  static String? getString(String key) {
    return ConfigPreferences.instance!.getString(key);
  }

  static List<String>? getStringList(String key) {
    return ConfigPreferences.instance!.getStringList(key);
  }

  ///////////////
  /// SETTERS ///
  /////////////// 
  static Future<bool> setBool(String key, bool value) {
    return ConfigPreferences.instance!.setBool(key, value);
  }

  static Future<bool> setDouble(String key, double value) {
    return ConfigPreferences.instance!.setDouble(key, value);
  }

  static Future<bool> setInt(String key, int value) {
    return ConfigPreferences.instance!.setInt(key, value);
  }

  static Future<bool> setString(String key, String value) {
    return ConfigPreferences.instance!.setString(key, value);
  }

  static Future<bool> setStringList(String key, List<String> value) {
    return ConfigPreferences.instance!.setStringList(key, value);
  }

  ///Singleton factory
  static final _instance = UtilPreferences._internal();

  factory UtilPreferences() {
    return _instance;
  }

  UtilPreferences._internal();
}
