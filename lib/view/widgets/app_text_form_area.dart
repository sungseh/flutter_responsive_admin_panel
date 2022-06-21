import 'package:flutter/material.dart';
import 'package:flutter_responsive_admin_panel/utils/utils.dart'; 

class AppTextFormArea extends StatelessWidget {
  final TextEditingController controller;
  final String placeholder;
  final String label;
  final String? Function(String?)? validator;

  const AppTextFormArea({
    Key? key, 
    required this.controller, 
    required this.placeholder, 
    required this.label,
    this.validator
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 8
      ),
      child: TextFormField(
        decoration: inputDecoration(
          hint: placeholder,
          label: label,
          controller: controller, 
          bgColor: Colors.red,
          contentPadding: const EdgeInsets.only(right: 0, left: 10, top: 15, bottom: 5),
        ),
        // decoration: InputDecoration(
        //   hintText: placeholder,
        //   border: const OutlineInputBorder(),
        //   labelText: label,
        //   contentPadding: const EdgeInsets.only(right: 0, left: 10, top: 15, bottom: 5),
        //   suffixIcon: Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: CircleAvatar(
        //       radius: 15,
        //       backgroundColor: Colors.grey[300],
        //       child: IconButton(
        //         icon: const Icon(Icons.close, size: 15), 
        //         onPressed: (){
        //           controller.clear();
        //         }
        //       ),
        //     ),
        //   )
        // ),
        textAlignVertical: TextAlignVertical.top,
        minLines: 5,
        maxLines: null,
        keyboardType: TextInputType.multiline,
        controller: controller,
        validator: validator
      ),  
    );
  }
}