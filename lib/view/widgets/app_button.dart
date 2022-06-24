import 'package:flutter/material.dart'; 

class AppButton extends StatelessWidget {
  final String? title;
  final Color? color;
  final void Function()? onPressed;

  const AppButton({
    Key? key, 
    this.title, 
    this.color = Colors.white,
    this.onPressed, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        color: Theme.of(context).primaryColor,
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 16,
        ),
        height: 45,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.add,
              color: color,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              title ?? "No title",
              style: TextStyle(
                color: color,
                fontSize: 16,
                fontWeight: FontWeight.w600
              ),
            )
          ],
        )
      ),
    ); 
  }
}