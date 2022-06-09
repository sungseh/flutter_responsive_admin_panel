import 'package:flutter/material.dart';
import 'package:flutter_responsive_admin_panel/configs/configs.dart';
import 'package:flutter_responsive_admin_panel/misc/misc.dart';

ResDeviceScreenType getDeviceType(MediaQueryData mediaQuery){
  double deviceWidth = mediaQuery.size.shortestSide;

  if(deviceWidth > kTabletBreakpointMax){
    return ResDeviceScreenType.desktop;
  } else if (deviceWidth > kMobileBreakpointMax){
    return ResDeviceScreenType.tablet;
  } else if (deviceWidth < kMobileBreakpointMin){
    return ResDeviceScreenType.watch;
  }

  return ResDeviceScreenType.mobile; 
}