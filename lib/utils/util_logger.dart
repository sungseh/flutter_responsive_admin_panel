import 'dart:developer' as developer;
import 'package:flutter_responsive_admin_panel/configs/configs.dart'; 
 

class UtilLogger {
  static const String tag = "SOURCEAPP";

  static log([String tag = tag, dynamic msg]) {
    if (ConfigApplication.debug) {
      developer.log('$msg', name: tag.toUpperCase()); 
    }
  }

  ///Singleton factory
  static final UtilLogger _instance = UtilLogger._internal();

  factory UtilLogger() {
    return _instance;
  }

  UtilLogger._internal();
}
