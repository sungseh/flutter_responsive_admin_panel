part of 'audios_bloc.dart';

abstract class AudiosEvent extends Equatable {
  const AudiosEvent();

  @override
  List<Object> get props => [];
}
  
class LoadAudiosEvent extends AudiosEvent { 
  const LoadAudiosEvent();

  @override
  List<Object> get props => [];
}

class UpdateAudiosEvent extends AudiosEvent { 
  final List<AudioModel?>? audios; 

  const UpdateAudiosEvent(this.audios);

  @override
  List<Object> get props => [audios!]; 
}
