import 'package:flutter/material.dart'; 

class AppTextFieldContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Decoration? decoration;
  
  const AppTextFieldContainer({
    Key? key, 
    required this.child, 
    this.padding, 
    this.margin, 
    this.decoration
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: padding,
      margin: margin,
      decoration: decoration,
      // decoration: BoxDecoration(
      //   color: Colors.grey[200],
      //   border: Border.all(color: Colors.grey[300]!),
      //   borderRadius: BorderRadius.circular(4)
      // ),
      child: child
      // child: DropdownButtonFormField(
      //   borderRadius: BorderRadius.circular(0),
      //   itemHeight: 50,
      //   decoration: const InputDecoration(
      //     border: InputBorder.none
      //   ),
      //   // decoration: inputDecoration(
      //   //   hint: placeholder,
      //   //   label: "title",
      //   //   controller: controller, 
      //   // ),
      //   onChanged: onChanged,
      //   onSaved: onSaved,
      //   value: value,
      //   hint: Text(placeholder),
      //   items: items
      // )
    );  
  }
}