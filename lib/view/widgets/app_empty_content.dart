import 'package:flutter/material.dart';
import 'package:flutter_responsive_admin_panel/configs/configs.dart'; 

@immutable
class AppEmptyContent extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final double? width;
  final double? height; 
  final EdgeInsetsGeometry? padding;
  
  const AppEmptyContent( {
    Key? key,
    this.title, 
    this.subtitle, 
    this.width,
    this.height,
    this.padding
  }) : super(key: key);

  @override
  Widget build(BuildContext context) { 
    return Container(
      padding: padding,
      child: Center( 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[ 
            const Image(
              image: AssetImage(Images.nocontent),
              width: 150,
            ),
            const SizedBox(
              height: 20
            ),
            Text(
              title ?? "Title"
            ),
            Text(
              subtitle ?? "Subtitle"
            ),
          ],
        ),
      ),
    );
  }
}
 