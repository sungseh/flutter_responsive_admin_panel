import 'package:shared_preferences/shared_preferences.dart';

class ConfigPreferences {
  static SharedPreferences? instance;
  static const String reviewIntro = 'review';
  static const String reviewTutorial = 'tutorial'; 
  static const String user = 'user';
  static const String language = 'language';
  static const String notification = 'notification';
  static const String theme = 'theme';
  static const String darkOption = 'darkOption';
  static const String font = 'font';
  static const String search = 'search';
  static const String version = 'version';
  static const String keyboardHeight = 'keyboardHeight';

  static const String business = 'business';

  static Future<void> setPreferences() async { 
    instance = await SharedPreferences.getInstance();
  }

  ///Singleton factory
  static final ConfigPreferences _instance = ConfigPreferences._internal();

  factory ConfigPreferences() {
    return _instance;
  }

  ConfigPreferences._internal();
} 
 