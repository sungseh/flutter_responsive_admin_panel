part of 'videos_bloc.dart';

abstract class VideosEvent extends Equatable {
  const VideosEvent();

  @override
  List<Object> get props => [];
}
  
class LoadVideos extends VideosEvent { 
  const LoadVideos();

  @override
  List<Object> get props => [];
}

class UpdateVideos extends VideosEvent { 
  final List<VideoModel?>? videos; 

  const UpdateVideos(this.videos);

  @override
  List<Object> get props => [videos!]; 
}
