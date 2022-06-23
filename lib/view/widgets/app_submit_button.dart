import 'package:flutter/material.dart'; 

class AppSubmitButton extends StatelessWidget {
  final String? title;
  final bool uploadStarted;
  final void Function()? onPressed;

  const AppSubmitButton({
    Key? key, 
    required this.uploadStarted, 
    this.title,
    this.onPressed, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      height: 45,
      child: uploadStarted == true ?
      const Center(
        child: SizedBox(
          height: 30, 
          width: 30,
          child: CircularProgressIndicator()
        )
      ) :
      TextButton(
        onPressed: onPressed,
        child: Text(
          title ?? "No title",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600
          ),
        )
      )
    );
  }
}