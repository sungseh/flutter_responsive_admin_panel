import 'package:flutter/material.dart';

class AppCoverWidget extends StatelessWidget {
  final Widget widget;

  const AppCoverWidget({
    Key? key, 
    required this.widget
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 0,
        bottom: 16
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey[300]!, 
            blurRadius: 10, 
            offset: const Offset(3, 3)
          )
        ],
      ),
      child: widget 
    );
  }
}