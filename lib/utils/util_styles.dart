import 'package:flutter/material.dart';
import 'package:flutter_responsive_admin_panel/configs/configs.dart';

InputDecoration inputDecoration({hint, label, controller, EdgeInsetsGeometry? contentPadding, Color? bgColor, Color? textColor}) {
  return InputDecoration(
    hintText: hint,
    hintStyle: TextStyle(
      color: Colors.grey[500]!
    ),
    // counterStyle: TextStyle(
    //   color: Colors.yellow
    // ),
    // labelStyle: TextStyle(
    //   color: Colors.green
    // ),
    iconColor: Colors.blueGrey,
    labelText: label,
    // fillColor: bgColor,
    helperStyle: const TextStyle(
      color: Colors.purple
    ),
    fillColor: ConfigColors.bgColor, 
    filled: true,

    border: const OutlineInputBorder(),
    contentPadding: contentPadding ?? const EdgeInsets.only(right: 0, left: 10),
    suffixIcon: Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        radius: 15,
        // backgroundColor: Colors.grey[300],
        // backgroundColor: bgColor,
        child: IconButton(
          icon: const Icon(
            Icons.close, size: 15
          ),
          onPressed: () {
            controller.clear();
          }
        ),
      ),
    )
  );
}
 
ButtonStyle buttonStyle(Color? color) {
  return ButtonStyle(
    padding: MaterialStateProperty.resolveWith(
      (states) => const EdgeInsets.only(
        left: 40, 
        right: 40, 
        top: 15, 
        bottom: 15
      )
    ),
    backgroundColor: MaterialStateProperty.resolveWith((states) => color),
    shape: MaterialStateProperty.resolveWith(
      (states) => RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25)
      )
    )
  );
}
