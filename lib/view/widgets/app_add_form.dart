import 'package:flutter/material.dart';
import 'package:flutter_responsive_admin_panel/configs/config_colors.dart';

class AppAddForm extends StatelessWidget {
  final List<Widget> children;
  final Key formKey;

  const AppAddForm({
    Key? key, 
    required this.children, 
    required this.formKey
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 3,
        bottom: 16
      ),
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 0,
        bottom: 16
      ),
      decoration: BoxDecoration(
        color: ConfigColors.secondaryColor,
        borderRadius: BorderRadius.circular(10), 
      ),
      // child: widget 
      child: Form( 
        key: formKey,
        child: ListView(
          shrinkWrap: true,
          children: children,
        )
      )
    );
  }
}