import 'package:flutter/material.dart';
import 'package:flutter_responsive_admin_panel/configs/responsive_layout/responsive.dart';

class ResLayout extends StatelessWidget {
  final Widget Function (
    BuildContext context, 
    ResSizingInformation sizingInformation,
  )? builder;

  const ResLayout({
    Key? key, 
    this.builder
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    
    return LayoutBuilder(
      builder: (context, boxConstraints){
        var sizingInformation = ResSizingInformation(
          orientation: mediaQuery.orientation,
          deviceScreenType: getDeviceType(mediaQuery),
          screenSize: mediaQuery.size,
          localWidgetSize: Size( 
            boxConstraints.maxWidth,
            boxConstraints.maxHeight 
          )
        );
        return builder!(context, sizingInformation);
      } 
    ); 
  }
}