import 'package:flutter/material.dart';
import 'package:flutter_responsive_admin_panel/configs/config_colors.dart'; 

class AppTitleFont extends StatelessWidget {
  final String? title;
  final int? maxLines;
  final Color? color;
  
  const AppTitleFont({
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
          fontSize: 16, 
          fontWeight: FontWeight.w600,
          color: color ?? ConfigColors.textColor
        ),
      ),
    );
  }
}