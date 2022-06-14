import 'package:flutter/material.dart'; 

class AppDropDown extends StatelessWidget {
  final void Function(Object?)? onChanged;
  final void Function(Object?)? onSaved;
  final List<DropdownMenuItem<Object>>? items;
  final String placeholder;
  final Object? value;

  const AppDropDown({
    Key? key, 
    this.onChanged, 
    this.onSaved, 
    required this.items, 
    required this.placeholder, 
    this.value
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {  
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(
        horizontal: 15
      ),
      margin: const EdgeInsets.symmetric(
        vertical: 8
      ),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(4)
      ),
      child: DropdownButtonFormField(
        borderRadius: BorderRadius.circular(0),
        itemHeight: 50,
        decoration: const InputDecoration(border: InputBorder.none),
        onChanged: onChanged,
        onSaved: onSaved,
        value: value,
        hint: Text(placeholder),
        items: items
      )
    ); 
  }
}