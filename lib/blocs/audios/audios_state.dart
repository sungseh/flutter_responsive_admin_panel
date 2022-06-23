part of 'audios_bloc.dart';

abstract class AudiosState extends Equatable {
  const AudiosState();
  
  @override
  List<Object> get props => [];
}

class AudiosInitialState extends AudiosState {}

class AudiosLoadingState extends AudiosState {
  @override
  List<Object> get props => [];
}

class AudiosLoadedState extends AudiosState {  
  final List<AudioModel?>? audios; 

  const AudiosLoadedState({this.audios});

  @override
  List<Object> get props => [audios!];

  @override
  String toString() => 'AudiosLoaded  {audios: $audios}';
}
 
class AudiosNotLoadedState extends AudiosState {
  @override
  List<Object> get props => [];
}

class AudiosIsEmptyState extends AudiosState {
  @override
  List<Object> get props => [];
}
