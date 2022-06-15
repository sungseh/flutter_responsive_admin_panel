import 'package:flutter/material.dart';

class ConfigColors {   
  // static Color sourceTeal = const Color(0xFF0D5565);
  static Color sourceTeal = const Color(0xFF00758D);
  static Color sourceLightTeal = const Color(0xFF7EB3B9);
  static Color sourceDarkGrey = const Color(0xFF353535);
  static Color sourceGrey = const Color.fromARGB(255, 155, 155, 155);
  static Color sourceGreen = const Color(0xFF00758D);
  static Color sourceWatercolorGreen = const Color(0xFFAEC4BD);
  static Color sourceYellow = const Color(0xFFFFCE00); 
  static Color sourceGold = const Color(0xFFD8BE37);
  static Color sourceBlack = const Color(0xFF000000);
  static Color sourceDarkYellow = const Color(0xFFA97D04);
  static Color sourceWhite = const Color.fromARGB(223, 255, 255, 255);
  static Color sourceTransBlack = const Color.fromARGB(52, 255, 255, 255);  

  static Color primaryColor = const Color(0xFF2697FF);
  static Color secondaryColor = const Color(0xFF2A2D3E);
  static Color bgColor = const Color(0xFF212332);

  ///Singleton factory
  static final ConfigColors _instance = ConfigColors._internal();

  factory ConfigColors() {
    return _instance;
  }
 
  ConfigColors._internal();
}
