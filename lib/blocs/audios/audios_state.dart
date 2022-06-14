part of 'audios_bloc.dart';

abstract class AudiosState extends Equatable {
  const AudiosState();
  
  @override
  List<Object> get props => [];
}

class AudiosInitial extends AudiosState {}

class AudiosLoading extends AudiosState {
  @override
  List<Object> get props => [];
}

class AudiosLoaded extends AudiosState {  
  final List<AudioModel?>? audios; 

  const AudiosLoaded({this.audios});

  @override
  List<Object> get props => [audios!];

  @override
  String toString() => 'AudiosLoaded  {audios: $audios}';
}
 
class AudiosNotLoaded extends AudiosState {
  @override
  List<Object> get props => [];
}

class AudiosIsEmpty extends AudiosState {
  @override
  List<Object> get props => [];
}
