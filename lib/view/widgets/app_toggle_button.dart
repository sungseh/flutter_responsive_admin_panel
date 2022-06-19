import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'; 

class AppToggleButton extends StatefulWidget {
  final String label;
  final bool value; 
  final void Function(bool)? onChanged;

  const AppToggleButton({
    Key? key,  
    this.onChanged, 
    required this.value, 
    required this.label, 
  }) : super(key: key);

  @override
  State<AppToggleButton> createState() => _AppToggleButtonState();
}

class _AppToggleButtonState extends State<AppToggleButton> {
  bool isSwitch = false;
  bool? dynamicSwitch;

  @override
  Widget build(BuildContext context) {
    handleSwitch(bool value) {
      setState(() {
        isSwitch = value;
        dynamicSwitch = value;
      });
    }

    dynamicSwitch = widget.value;

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget.label),
          CupertinoSwitch(
            activeColor: Theme.of(context).primaryColor,
            value: dynamicSwitch != true ? isSwitch : dynamicSwitch!,
            onChanged: (val) {
              handleSwitch(val);
            }, 
          ), 
        ],
      ),
    ); 
  }
}
 