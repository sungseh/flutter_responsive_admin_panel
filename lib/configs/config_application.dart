import 'package:flutter_responsive_admin_panel/models/models.dart';

class ConfigApplication {  
  static String name = "Source Admin";  
  static bool debug = false; 
  static String version = '0.0.3+12'; 
  static UserModel? user;
  // static String? pushToken;
  // static int ageLimit = 13;
  static String ourWebsite = "https://www.sourceapp.com";
  static String privacyPolicy = "https://www.sourceapp.com/privacy";
  static String supportEmail = "support@sourceapp.com";
  static String adminEmail = "info@sourceapp.com";
  static String appStoreLink = "https://apps.apple.com/gh/app/sourceapp/id1542651567";
  static String playStoreLink = "https://play.google.com/store/apps/details?id=com.sacredscienceofsound.sourceapp";
  static String androidPackageName = "com.sacredscienceofsound.sourceapp";
  static String iOSAppId = "id1589940964";
 
  ///Singleton factory
  static final ConfigApplication _instance = ConfigApplication._internal();

  factory ConfigApplication() {
    return _instance;
  }
 
  ConfigApplication._internal();
}
