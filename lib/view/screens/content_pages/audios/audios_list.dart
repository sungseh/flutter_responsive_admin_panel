import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_responsive_admin_panel/models/models.dart';
import 'package:flutter_responsive_admin_panel/view/widgets/widgets.dart';

import '../../../../blocs/audios/audios_bloc.dart';
import 'audios_add.dart';

class AudiosList extends StatefulWidget {
  const AudiosList({Key? key}) : super(key: key);

  @override
  State<AudiosList> createState() => _AudiosListState();
}

class _AudiosListState extends State<AudiosList> {
  late AudiosBloc _audiosBloc;

  @override
  void initState() {
    _audiosBloc = BlocProvider.of<AudiosBloc>(context);
    _audiosBloc.add(const LoadAudios()); 
    super.initState();
  }

  _onTapAdd(AudioModel? item) {
  }

  _onTapAudio(AudioModel? item) {
    // Navigator.pushNamed(
    //   context,
    //   Routes.audioPlayer,
    //   arguments: item
    // );
  }

  Widget _buildAudios(){
    return BlocBuilder<AudiosBloc, AudiosState>(
      builder: (context, state) { 
        if (state is AudiosLoaded) {
          List<AudioModel?>? audios = state.audios;  

          if(audios!.isEmpty){
            return const AppEmptyContent(
              title: "No Audios",
              subtitle: "No data available. Upload first!"
            );
          } else {
            return ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 30, bottom: 20),
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: 10,
              itemBuilder: (_, int index) {
                return AppAudioItem( 
                  // onPressed: _onTapAudio, 
                  item: audios[index]!,
                  // type: AudioViewType.category,
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
 
  Widget _buildAudioss(){ 
    return BlocBuilder<AudiosBloc, AudiosState>(
      builder: (context, state) { 
        if (state is AudiosLoaded) {
          List<AudioModel?>? audios = state.audios;  

          if(audios!.isEmpty){
            return const AppEmptyContent(
              title: "No Audios",
              subtitle: "No data available. Upload first!"
            );
          }
        }

        return Container();
      }
    );
  }

  Widget _buildAudio(){
    return BlocBuilder<AudiosBloc, AudiosState>(
      builder: (context, state) { 
        if (state is AudiosLoaded) { 
          List<AudioModel?>? audios = state.audios; 

          if(audios!.isEmpty){
            return const AppEmptyContent(
              title: "No Audios",
              subtitle: "No data available.\nUpload first!"
            );
          }
  
          return Column(
            children: audios.map((item) {
              return Container( 
                color: const Color.fromARGB(83, 196, 196, 196),
                padding: const EdgeInsets.only(top: 2), 
                // child: Container(
                //   height: 30,
                //   width: 30,
                //   color: Colors.red,
                //   margin: EdgeInsets.all(4),
                // ),
                child: AppAudioItem( 
                  // onPressed: _onTapAudio, 
                  item: item!,
                  // type: AudioViewType.category,
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
          //   children: audios.map((item) { 
          //     return AppAudioItem(
          //       onPressed: _onTapAudio,   
          //       item: item,
          //       type: AudioViewType.recent,
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
            return const AppAudioItem(
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
      listSection: _buildAudios(),
      addSection: const AddAudio()
      // addSection: Container(
      //   height: 200,
      //   width: 200,
      //   margin: EdgeInsets.symmetric(horizontal: 8),
      //   color: Colors.red,
      // ),
    );
  }
}