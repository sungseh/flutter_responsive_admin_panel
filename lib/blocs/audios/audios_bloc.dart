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
  super(AudiosLoading()) {
    on<LoadAudios>(_onLoadAudios);
    on<UpdateAudios>(_onUpdateAudios);
  }

  void _onLoadAudios(LoadAudios event, Emitter<AudiosState> emit) async {
    emit(AudiosLoading());
    _audiosSub?.cancel();
    _audiosSub = _audiosRepo?.audios()
      .listen((audios) => add(UpdateAudios(audios))); 
  }

  void _onUpdateAudios(UpdateAudios event, Emitter<AudiosState> emit) async {
    emit(AudiosLoaded( 
      audios: event.audios, 
    ));
  }
}

 
