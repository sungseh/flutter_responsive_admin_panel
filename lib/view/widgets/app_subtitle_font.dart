import 'package:flutter/material.dart'; 

class AppSubTitleFont extends StatelessWidget {
  final String? title;
  final int? maxLines;
  
  const AppSubTitleFont({
    Key? key, 
    this.title, 
    this.maxLines
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
        style: const TextStyle(
          fontSize: 12, 
        ), 
      ),
    );
  }
}