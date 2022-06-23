import 'package:flutter/material.dart';


class AppEmptyPage extends StatelessWidget {
  final IconData icon;
  final String message;

  const AppEmptyPage({
    Key? key, 
    required this.icon, 
    required this.message
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon, size: 80, 
            color: Colors.grey
          ),
          const SizedBox(height: 10,),
          Text(
            message, 
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20, 
              color:Colors.grey, 
              fontWeight: FontWeight.w600
            ), 
          )
        ]
      ),
    );
  }
}