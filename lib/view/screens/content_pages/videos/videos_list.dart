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
    _videosBloc.add(const LoadVideos()); 
    super.initState();
  }

  _onTapAdd(VideoModel? item) {
  }

  _onTapVideo(VideoModel? item) {
    // Navigator.pushNamed(
    //   context,
    //   Routes.videoPlayer,
    //   arguments: item
    // );
  }

  Widget _buildVideos(){
    return BlocBuilder<VideosBloc, VideosState>(
      builder: (context, state) { 
        if (state is VideosLoaded) {
          List<VideoModel?>? videos = state.videos;  

          if(videos!.isEmpty){
            return const AppEmptyContent(
              title: "No Videos",
              subtitle: "No data available. Upload first!"
            );
          } else {
            return ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 30, bottom: 20),
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: 10,
              itemBuilder: (_, int index) {
                return AppVideoItem( 
                  // onPressed: _onTapVideo, 
                  item: videos[index]!,
                  // type: VideoViewType.category,
                );
                // return Container(
                //   margin: const EdgeInsets.all(2),
                //   color: Colors.red,
                //   height: 60,
                //   width: 60,
                // );
              }
            );
          }
        }

        return Container();
      }
    ); 
  }
 
  Widget _buildVideoss(){ 
    return BlocBuilder<VideosBloc, VideosState>(
      builder: (context, state) { 
        if (state is VideosLoaded) {
          List<VideoModel?>? videos = state.videos;  

          if(videos!.isEmpty){
            return const AppEmptyContent(
              title: "No Videos",
              subtitle: "No data available. Upload first!"
            );
          }
        }

        return Container();
      }
    );
  }

  Widget _buildVideo(){
    return BlocBuilder<VideosBloc, VideosState>(
      builder: (context, state) { 
        if (state is VideosLoaded) { 
          List<VideoModel?>? videos = state.videos; 

          if(videos!.isEmpty){
            return const AppEmptyContent(
              title: "No Videos",
              subtitle: "No data available.\nUpload first!"
            );
          }
  
          return Column(
            children: videos.map((item) {
              return Container( 
                color: const Color.fromARGB(83, 196, 196, 196),
                padding: const EdgeInsets.only(top: 2), 
                // child: Container(
                //   height: 30,
                //   width: 30,
                //   color: Colors.red,
                //   margin: EdgeInsets.all(4),
                // ),
                child: AppVideoItem( 
                  // onPressed: _onTapVideo, 
                  item: item!,
                  // type: VideoViewType.category,
                ),
              );
            }).toList(),
          );
 
          // return GridView.count(
          //   padding: const EdgeInsets.only(
          //     left: 8, 
          //     right: 8, 
          //     top: 8
          //   ), 
          //   mainAxisSpacing: 8,
          //   crossAxisSpacing: 8,
          //   crossAxisCount: 2,
          //   // childAspectRatio: ratio,
          //   shrinkWrap: true, 
          //   children: videos.map((item) { 
          //     return AppVideoItem(
          //       onPressed: _onTapVideo,   
          //       item: item,
          //       type: VideoViewType.recent,
          //     );
          //   }).toList(),
          // ); 
        }

        return GridView.builder(
          padding: const EdgeInsets.only(
            left: 8, 
            right: 8, 
            top: 8
          ), 
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true, 
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: 8,
          itemBuilder: (context, index) { 
            // return const AppVideoItem(
            return const AppVideoItem(
              item: null,
              // type: VideoViewType.grid,
            ); 
          },
        ); 
      },
    ); 
  }

  @override
  Widget build(BuildContext context) {
    return AppSectionFrame(
      listSection: _buildVideos(),
      addSection: const AddVideo()
      // addSection: Container(
      //   height: 200,
      //   width: 200,
      //   margin: EdgeInsets.symmetric(horizontal: 8),
      //   color: Colors.red,
      // ),
    );
  }
}