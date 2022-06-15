import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'; 

class AppToggleButton extends StatefulWidget {
  final String label;
  // final List<bool> isSelecteds;
  // final bool isSelected;
  // final void Function(int)? onTap;
  final void Function()? onTap;
  final void Function(bool)? onChanged;

  const AppToggleButton({
    Key? key, 
    // required this.isSelecteds, 
    // required this.isSelected, 
    this.onTap, 
    this.onChanged, 
    required this.label
  }) : super(key: key);

  @override
  State<AppToggleButton> createState() => _AppToggleButtonState();
}

class _AppToggleButtonState extends State<AppToggleButton> {
  bool toggleValue = false;

  toggleButton(){
    setState(() {
      toggleValue = !toggleValue;
    });
  }
 
  @override
  Widget build(BuildContext context) {
    return MergeSemantics(
      child: ListTile(
        title: Text(widget.label),
        trailing: CupertinoSwitch(
          value: toggleValue,
          onChanged: (bool value) { setState(() { toggleValue = value; }); },
          // onChanged: widget.onChanged
        ),
        // onTap: () { setState(() { toggleValue = !toggleValue; }); },
        onTap: widget.onTap
      ),
    ); 
  }
}
 