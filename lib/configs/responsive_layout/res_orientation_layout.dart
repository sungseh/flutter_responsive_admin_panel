import 'package:flutter/material.dart';

class OrientationLayout extends StatelessWidget {
  final Widget portrait;
  final Widget? landscape;

  const OrientationLayout({
    Key? key, 
    required this.portrait, 
    this.landscape
  }) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;

    if(orientation == Orientation.landscape){
      return landscape ?? portrait;
    }
 
    return portrait;
  }
}