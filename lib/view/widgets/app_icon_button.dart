import 'package:flutter/material.dart'; 

class AppIconButton extends StatelessWidget {
  final void Function()? onPressed;
  final IconData? icon;

  const AppIconButton({
    Key? key, 
    this.onPressed, 
    this.icon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          height: 35,
          width: 45,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10)
          ),
          child: Icon(
            icon ?? Icons.close,
            size: 16, 
            color: Colors.grey[800]
          )
        )
      ),
    );
  }
}