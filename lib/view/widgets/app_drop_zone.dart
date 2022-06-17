import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:flutter_responsive_admin_panel/models/models.dart'; 

class AppDropZone extends StatefulWidget {
  final ValueChanged<FileModel> onDroppedFile;

  const AppDropZone({
    Key? key, 
    required this.onDroppedFile
  }) : super(key: key);

  @override
  State<AppDropZone> createState() => _AppDropZoneState();
}

class _AppDropZoneState extends State<AppDropZone> {
  late DropzoneViewController controller;
  bool highlight = false;

  Future uploadedFile(dynamic event) async {
    final name = event.name; 
    final mime = await controller.getFileMIME(event);
    final byte = await controller.getFileSize(event);
    final url = await controller.createFileUrl(event);

    print('Name : $name');
    print('Mime: $mime');

    print('Size : ${byte / (1024 * 1024)}');
    print('URL: $url');

    final droppedFile = FileModel(
      name: name, 
      mime: mime, 
      bytes: byte, 
      url: url
    );

    widget.onDroppedFile(droppedFile);
    setState(() {
      highlight = false;
    });
  }

  Widget buildDecoration({required Widget child}){
    final colorBackground =  highlight? Colors.blue: Colors.green;
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(10),
        color: colorBackground,
        child: DottedBorder(
          borderType: BorderType.RRect,
          color: Colors.white,
          strokeWidth: 3,
          dashPattern: const [8,4],
          radius: const Radius.circular(10),
          padding: EdgeInsets.zero,
          child: child
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return buildDecoration(
      child: Stack(
        children: [
          DropzoneView(
            onCreated: (controller) => this.controller = controller,
            onDrop: uploadedFile,
            onHover:() => setState(()=> highlight = true),
            onLeave: ()=> setState(()=>highlight = false),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.cloud_upload_outlined,
                  size: 80,
                  color: Colors.white,
                ),
                const Text(
                  'Drop Files Here',
                  style: TextStyle(
                    color: Colors.white, 
                    fontSize: 24
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton.icon(
                  onPressed: () async {
                    final events = await controller.pickFiles();
                    if(events.isEmpty) return;
                    uploadedFile(events.first);
                  },
                  icon: const Icon(Icons.search),
                  label: const Text(
                    'Choose File',
                    style: TextStyle(
                      color: Colors.white, 
                      fontSize: 15
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20
                    ),
                    primary: highlight? Colors.blue : Colors.green.shade300,
                    shape: const RoundedRectangleBorder()
                  ),
                )
              ],
            ),
          ),
        ],
      )
    ); 
  }
} 