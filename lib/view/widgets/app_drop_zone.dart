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

  Widget buildDecoration({ required Widget child }){
    final colorBackground =  highlight? Colors.red: Theme.of(context).primaryColor.withOpacity(0.8);
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 8
      ),
      padding: const EdgeInsets.all(8),
      color: colorBackground,
      child: DottedBorder(
        borderType: BorderType.RRect,
        color: Colors.white,
        strokeWidth: 2,
        dashPattern: const [8, 8],
        // radius: const Radius.circular(10),
        padding: EdgeInsets.zero,
        child: child
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
            onHover: () => setState(() => highlight = true),
            onLeave: () => setState(() => highlight = false),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 4
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Icon(
                    Icons.cloud_upload_outlined,
                    size: 64,
                    color: Colors.white,
                  ),
                  const Text(
                    'Drop Files Here',
                    style: TextStyle(
                      color: Colors.white, 
                      fontSize: 16
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      bottom: 16
                    ),
                    child: ElevatedButton.icon(
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
                          fontSize: 16
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        primary: highlight? Colors.blue : Theme.of(context).primaryColor,
                        shape: const RoundedRectangleBorder()
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      )
    ); 
  }
} 