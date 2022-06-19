import 'package:flutter/material.dart'; 

class AppBodyFont extends StatelessWidget {
  final String? title;
  final int? maxLines;
  
  const AppBodyFont({
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
          fontStyle: FontStyle.italic
        ), 
      ),
    ); 
  }
}