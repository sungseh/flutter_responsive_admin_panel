import 'dart:developer';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_responsive_admin_panel/configs/configs.dart'; 

class AppFileUploadButton extends StatelessWidget {
  const AppFileUploadButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) { 
    return IconButton(
      icon: Image.asset(Images.avatar),
      iconSize: 150,
      onPressed: () async {
        var picked = await FilePicker.platform.pickFiles();

        if (picked != null) {
          log(picked.files.first.name);
        }
      },
    );

    // return ElevatedButton(
    //   onPressed: () async {
    //     var picked = await FilePicker.platform.pickFiles();

    //     if (picked != null) {
    //       log(picked.files.first.name);
    //     }
    //   },
    //   child: Text('UPLOAD FILE'),
    // ); 
  }
}