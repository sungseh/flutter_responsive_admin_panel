import 'package:flutter/material.dart';
import 'package:flutter_responsive_admin_panel/misc/misc.dart';  

class ResSizingInformation {
  final Orientation? orientation;
  final ResDeviceScreenType? deviceScreenType;
  final Size? screenSize;
  final Size? localWidgetSize;

  ResSizingInformation({
    this.orientation, 
    this.deviceScreenType, 
    this.screenSize, 
    this.localWidgetSize
  }); 

  @override
  String toString(){
    return "Orientation: $orientation \nDevice Type: $deviceScreenType \nScreen Size: $screenSize \nLocal Widget Size: $localWidgetSize";
  }
}