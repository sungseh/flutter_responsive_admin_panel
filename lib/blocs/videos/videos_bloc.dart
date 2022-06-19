import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_responsive_admin_panel/models/models.dart';
import 'package:flutter_responsive_admin_panel/repositories/firestore/video_firestore.dart'; 
part 'videos_event.dart';
part 'videos_state.dart';
  
class VideosBloc extends Bloc<VideosEvent, VideosState> { 
  final VideoFirestore? _videosRepo;
  StreamSubscription? _videosSub;  

  VideosBloc({ 
    required VideoFirestore? videosRepo, 
  }) : 
  assert(videosRepo != null),
  _videosRepo = videosRepo,
  super(VideosLoading()) {
    on<LoadVideos>(_onLoadVideos);
    on<UpdateVideos>(_onUpdateVideos);
  }

  void _onLoadVideos(LoadVideos event, Emitter<VideosState> emit) async {
    emit(VideosLoading());
    _videosSub?.cancel();
    _videosSub = _videosRepo?.videos()
      .listen((videos) => add(UpdateVideos(videos))); 
  }

  void _onUpdateVideos(UpdateVideos event, Emitter<VideosState> emit) async {
    emit(VideosLoaded( 
      videos: event.videos, 
    ));
  }
}

 
