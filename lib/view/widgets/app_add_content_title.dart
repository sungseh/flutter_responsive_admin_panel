import 'package:flutter/material.dart'; 

class AppAddContentTitle extends StatelessWidget {
  final String title;

  const AppAddContentTitle(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 25, 
          fontWeight: FontWeight.w700,
          color: Colors.white
        ), 
      ),
    );
  }
}