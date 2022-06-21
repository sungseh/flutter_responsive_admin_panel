import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_responsive_admin_panel/configs/configs.dart'; 

class AppToggleButton extends StatefulWidget {
  final String label;
  final bool value; 
  final void Function(bool)? onChanged;
  final Color? textColor;

  const AppToggleButton({
    Key? key,  
    this.onChanged, 
    required this.value, 
    required this.label, 
    this.textColor, 
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
          Text(
            widget.label,
            style: TextStyle(
              color: widget.textColor ?? ConfigColors.textColor 
            ),
          ),
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
 