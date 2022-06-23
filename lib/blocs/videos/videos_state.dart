part of 'videos_bloc.dart';

abstract class VideosState extends Equatable {
  const VideosState();
  
  @override
  List<Object> get props => [];
}

class VideosInitial extends VideosState {}

class VideosLoading extends VideosState {
  @override
  List<Object> get props => [];
}

class VideosLoaded extends VideosState {  
  final List<VideoModel?>? videos; 

  const VideosLoaded({this.videos});

  @override
  List<Object> get props => [videos!];

  @override
  String toString() => 'VideosLoaded  {videos: $videos}';
}
 
class VideosNotLoaded extends VideosState {
  @override
  List<Object> get props => [];
}

class VideosIsEmpty extends VideosState {
  @override
  List<Object> get props => [];
}
