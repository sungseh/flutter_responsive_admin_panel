import 'package:flutter/material.dart'; 

class VideoList extends StatefulWidget {
  const VideoList({Key? key}) : super(key: key);

  @override
  State<VideoList> createState() => _VideoListState();
}

class _VideoListState extends State<VideoList> { 
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text("Page Name: ${state.pageName}"),
            Text("Page Name: Videos List"),
            // const SizedBox(height: 30),
            // ElevatedButton(
            //   onPressed: () => BlocProvider.of<PageBloc>(context)
            //     .add(LoadPageEvent(state.number)), 
            //   child: const Icon(Icons.add),
            // ),
          ],
        ),
      ),
    );
    
  }
}