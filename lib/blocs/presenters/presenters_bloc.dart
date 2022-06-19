import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_responsive_admin_panel/models/models.dart';
import 'package:flutter_responsive_admin_panel/repositories/repositories.dart'; 

part 'presenters_event.dart';
part 'presenters_state.dart';
  
class PresentersBloc extends Bloc<PresentersEvent, PresentersState> { 
  final PresenterFirestore? _presentersRepo;
  StreamSubscription? _presentersSub;  

  PresentersBloc({ 
    required PresenterFirestore? presentersRepo
  }) : assert(presentersRepo != null),
  _presentersRepo = presentersRepo,
  super(PresentersLoading()) {
    on<LoadPresenters>(_onLoadPresenters);
    on<UpdatePresenters>(_onUpdatePresenters);
  }

  void _onLoadPresenters(LoadPresenters event, Emitter<PresentersState> emit) async {
    emit(PresentersLoading());
    _presentersSub?.cancel();
    _presentersSub = _presentersRepo?.presenters()
      .listen((presenters) => add(UpdatePresenters(presenters))); 
  }

  void _onUpdatePresenters(UpdatePresenters event, Emitter<PresentersState> emit) async {
    emit(PresentersLoaded(
      presenters: event.presenters, 
    ));
  }
}

 
