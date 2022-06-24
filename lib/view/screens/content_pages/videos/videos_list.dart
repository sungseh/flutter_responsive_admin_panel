import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_responsive_admin_panel/models/models.dart';
import 'package:flutter_responsive_admin_panel/view/widgets/widgets.dart';

import '../../../../blocs/videos/videos_bloc.dart';
import 'videos_add.dart';

class VideosList extends StatefulWidget {
  const VideosList({Key? key}) : super(key: key);

  @override
  State<VideosList> createState() => _VideosListState();
}

class _VideosListState extends State<VideosList> {
  late VideosBloc _videosBloc;

  @override
  void initState() {
    _videosBloc = BlocProvider.of<VideosBloc>(context);
    // _videosBloc.add(const LoadVideos()); 
    super.initState();
  }
 

  Widget _buildVideos(){
    return BlocBuilder<VideosBloc, VideosState>(
      builder: (context, state) { 
        if (state is! VideosLoaded) {
          _videosBloc.add(const LoadVideos());
        
          return ListView.builder(
            itemCount: 20,
            itemBuilder: (_, int index){
              return const AppVideoItem(item: null);
            }
          );
        } else {
          List<VideoModel?>? videos = state.videos; 

          if(videos!.isEmpty){
            return const AppEmptyContent(
              title: "No Video",
              subtitle: "No data available. Upload first!"
            );
          } else {
            return ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 30, bottom: 20),
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: videos.length,
              itemBuilder: (_, int index) {
                return AppVideoItem( 
                  item: videos[index]!,
                );
              }
            );
          }
        }
      }
    ); 
  }  
  

  @override
  Widget build(BuildContext context) {
    return AppSectionFrame(
      listSection: _buildVideos(),
      addSection: const AddVideo() 
    );
  }
}