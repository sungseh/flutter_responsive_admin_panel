import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_responsive_admin_panel/models/models.dart';
import '../../repositories/firestore/firestore_repo.dart';
part 'audios_event.dart';
part 'audios_state.dart';
  
class AudiosBloc extends Bloc<AudiosEvent, AudiosState> { 
  final AudioFirestore? _audiosRepo;
  StreamSubscription? _audiosSub;  

  AudiosBloc({ 
    required AudioFirestore? audiosRepo, 
  }) : 
  assert(audiosRepo != null),
  _audiosRepo = audiosRepo,
  super(AudiosLoadingState()) {
    on<LoadAudiosEvent>(_onLoadAudios);
    on<UpdateAudiosEvent>(_onUpdateAudios);
  }

  void _onLoadAudios(LoadAudiosEvent event, Emitter<AudiosState> emit) async {
    emit(AudiosLoadingState());
    _audiosSub?.cancel();
    _audiosSub = _audiosRepo?.audios()
      .listen((audios) => add(UpdateAudiosEvent(audios))); 
  }

  void _onUpdateAudios(UpdateAudiosEvent event, Emitter<AudiosState> emit) async {
    emit(AudiosLoadedState( 
      audios: event.audios, 
    ));
  }
}

 
