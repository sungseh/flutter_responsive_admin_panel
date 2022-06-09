import 'package:flutter/material.dart'; 

void appDialogBox (context, {void Function()? action, String? title, String? message}) {
  showDialog(
    barrierDismissible: true,
    context: context,
    builder: (BuildContext context){
      return AlertDialog(
        title: Text(title!),
        content: Text(message!),
        actions: [
          TextButton( 
            child: Text(
              "No",
              style: TextStyle(color: Theme.of(context).primaryColor)
            ),
            onPressed: (){
              Navigator.pop(context);
            }
          ),
          Container(
            color: Theme.of(context).primaryColor, 
            child: TextButton(
              onPressed: action,
              child: const Text(
                "Yes",
                style: TextStyle(
                  color: Colors.white
                ),
              )
            ),
          )
        ],
      );
    }
  );
}
 