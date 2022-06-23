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
    // _audiosBloc.add(const LoadAudios()); 
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
        if (state is! AudiosLoadedState) {
          _audiosBloc.add(const LoadAudiosEvent());
        
          return ListView.builder(
            itemCount: 20,
            itemBuilder: (_, int index){
              return const AppPresenterItem(item: null);
            }
          );
        } else {
          List<AudioModel?>? audios = state.audios; 

          if(audios!.isEmpty){
            return const AppEmptyContent(
              title: "No Audio",
              subtitle: "No data available. Upload first!"
            );
          } else {
            return ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 30, bottom: 20),
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: audios.length,
              itemBuilder: (_, int index) {
                return AppAudioItem( 
                  item: audios[index]!,
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
      listSection: _buildAudios(),
      addSection: const AddAudio() 
    );
  }
}