 
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_responsive_admin_panel/configs/responsive_layout/responsive.dart';
import 'package:flutter_responsive_admin_panel/misc/misc.dart';  

class ResScreenTypeLayout extends StatelessWidget {
  final Widget? watchLayout;
  final Widget mobileLayout;
  final Widget? tabletLayout;
  final Widget? desktopLayout;

  const ResScreenTypeLayout({
    Key? key, 
    this.watchLayout, 
    required this.mobileLayout, 
    this.tabletLayout, 
    this.desktopLayout
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResLayout(
      builder: (context, sizingInformation){
        if(sizingInformation.deviceScreenType == ResDeviceScreenType.tablet && 
          (Platform.isAndroid || Platform.isIOS || Platform.isWindows || Platform.isFuchsia)){ 
          if(tabletLayout != null){
            return tabletLayout!;
          } 
        }

        if(sizingInformation.deviceScreenType == ResDeviceScreenType.desktop &&  
          (Platform.isLinux || Platform.isMacOS || Platform.isWindows )){
          if(desktopLayout != null){
            return desktopLayout!;
          }
        }

        if(sizingInformation.deviceScreenType == ResDeviceScreenType.watch &&
          (Platform.isAndroid || Platform.isIOS ) ){ 
          if(watchLayout != null){
            return watchLayout!;
          }
        }

        return mobileLayout;
      },
    );
  }
}