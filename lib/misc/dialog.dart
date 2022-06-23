import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart'; 

void openToast(context, message){
  Fluttertoast.showToast(
    msg: message,
    gravity: ToastGravity.BOTTOM,
    textColor: Colors.white, 
  );
}

void openDialog(context, title, message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return SimpleDialog(
        contentPadding: const EdgeInsets.all(50),
        elevation: 0,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w900
            )
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            message,
            style: TextStyle(
              color: Colors.grey[900],
              fontSize: 16,
              fontWeight: FontWeight.w700
            )
          ),
          const SizedBox(
            height: 30,
          ),
          Center(
            child: TextButton(
              // style: buttonStyle(Colors.deepPurpleAccent),
              child: const Text(
                'Okay',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600
                ),
              ),
              onPressed: () => Navigator.pop(context),
            ),
          )
        ],
      );
    }
  );
}

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
 