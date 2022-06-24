import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_responsive_admin_panel/models/models.dart';

class AppDroppedFile extends StatelessWidget {
  final FileModel? file;
  const AppDroppedFile({
    Key? key,
    required this.file
  }) : super(key: key);
 
  Widget buildImage(BuildContext context){
    if (file == null) {
      return buildEmptyFile('No Selected File');
    }

    log(file!.url);

    return Column(
      children: [
        if (file != null) buildFileDetail(file),
        Image.network(
          file!.url,
          width: MediaQuery.of(context).size.width ,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.cover,
          errorBuilder:(context,error,_)=>buildEmptyFile('No Preview'),
        ),
      ],
    );
  }

  Widget buildEmptyFile(String text){
    return Container();
    // return Container(
    //   width: 120,
    //   height: 120,
    //   color: Colors.blue.shade300,
    //   child: Center(
    //     child: Text(text)
    //   ),
    // );
  }

  Widget buildFileDetail(FileModel? file) {
    // final style = const TextStyle( fontSize: 20);
    const style = TextStyle( fontSize: 20);
    return Container(
      margin: const EdgeInsets.only(left: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
          'Selected File Preview',
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20
            )
          ),
          Text(
          'Name: ${file?.name}',
            style: const TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 22
            )
          ),
          const SizedBox(
            height: 10
          ),
          Text(
            'Type: ${file?.mime}',
            style: style
          ),
          const SizedBox(
            height: 10
          ),
          Text(
            'Size: ${file?.size}',
            style: style
          ),
          const SizedBox(
            height: 20
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: buildImage(context)
        ),
      ],
    );
  }
}
