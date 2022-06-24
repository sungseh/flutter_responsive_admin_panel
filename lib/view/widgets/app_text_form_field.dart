import 'package:flutter/material.dart'; 
import 'package:flutter_responsive_admin_panel/utils/utils.dart';
import 'package:flutter_responsive_admin_panel/view/widgets/widgets.dart';

class AppTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String placeholder;
  final String title;
  final String? Function(String?)? validator;

  const AppTextFormField({
    Key? key, 
    required this.controller, 
    required this.placeholder, 
    required this.title,
    this.validator
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppTextFieldContainer(
      padding: const EdgeInsets.symmetric(
        vertical: 8
      ),
      decoration: const BoxDecoration(
        color: Colors.red
      ),
      child: TextFormField( 
        decoration: inputDecoration(
          hint: placeholder,
          label: title,
          controller: controller, 
        ),
        controller: controller,
        validator: validator
      ),
    );
  }
}