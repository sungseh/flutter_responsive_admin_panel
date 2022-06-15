import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';


class AppTagField extends StatefulWidget {
  final List paths;

  const AppTagField({
    Key? key, 
    required this.paths
  }) : super(key: key);

  @override
  State<AppTagField> createState() => _AppTagFieldState();
}

class _AppTagFieldState extends State<AppTagField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.paths.isEmpty ? 
      const Center(
        child: Text(
          'No path list were added'
        )
      ) :
      ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: widget.paths.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: CircleAvatar(
              child: Text(index.toString()),
            ),
            title: Text(widget.paths[index]),
            trailing: IconButton(
              icon: const Icon(Icons.delete_outline), 
              onPressed: (){
                setState(() {
                  widget.paths.remove(widget.paths[index]);
                  // _helperText = 'Added ${widget.paths.length} items';
                });
              }),
          );
        },
      ), 
    ); 
  }
}