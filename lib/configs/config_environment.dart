import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_responsive_admin_panel/configs/configs.dart';

class ConfigEnvironment {
  static String get filename {
    if (ConfigApplication.debug){
      return '.env.dev';
    } 
    return '.env.production';
  }

  static String get apiUrl {
    return dotenv.env['API_URL'] ?? 'API_URL not found!!!';
  }
}