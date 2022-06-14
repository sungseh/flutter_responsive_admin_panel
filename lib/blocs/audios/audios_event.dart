part of 'audios_bloc.dart';

abstract class AudiosEvent extends Equatable {
  const AudiosEvent();

  @override
  List<Object> get props => [];
}
  
class LoadAudios extends AudiosEvent { 
  const LoadAudios();

  @override
  List<Object> get props => [];
}

class UpdateAudios extends AudiosEvent { 
  final List<AudioModel?>? audios; 

  const UpdateAudios(this.audios);

  @override
  List<Object> get props => [audios!]; 
}
