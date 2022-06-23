import 'package:flutter/material.dart';
import 'package:flutter_responsive_admin_panel/configs/configs.dart'; 

class AppBodyFont extends StatelessWidget {
  final String? title;
  final int? maxLines;
  final Color? color;
  
  const AppBodyFont({
    Key? key, 
    this.title, 
    this.maxLines, 
    this.color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 2
      ),
      child: Text(
        title ?? "",
        maxLines: maxLines ?? 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 12,
          fontStyle: FontStyle.italic,
          color: color ?? ConfigColors.textColor
        ), 
      ),
    ); 
  }
}