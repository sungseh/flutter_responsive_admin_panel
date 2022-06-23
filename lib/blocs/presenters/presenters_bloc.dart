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
  super(PresentersLoadingState()) {
    on<LoadPresentersEvent>(_onLoadPresenters);
    on<RefreshPresentersEvent>(_onRefreshPresenters);
    on<UpdatePresentersEvent>(_onUpdatePresenters);
  }

  void _onLoadPresenters(LoadPresentersEvent event, Emitter<PresentersState> emit) async {
    emit(PresentersLoadingState());
    _presentersSub?.cancel(); 
    _presentersSub = _presentersRepo?.presenters()
      .listen((presenters) => add(UpdatePresentersEvent(presenters))); 
    // final presenters = await _presentersRepo?.infiniteScroll2(mounted: true, limit: 10);
    // UpdatePresentersEvent(presenters);
  }

  

  // try {
  //   if (event is PantauLaporanSearchEvent){
  //     laporan = await PantauLaporan.getSearchResult(qSearch: event.query);
  //     if (laporan!.isEmpty){
  //       yield PantauLaporanLoaded (laporan: laporan, hasReachedLimit: true);
  //     } else {
  //       yield PantauLaporanSearchState(
  //         laporan: laporan,
  //         hasReachedLimit: true,
  //       );
  //     }
  //   } else if (state is PantauLaporanInitial || state is PantauLaporanErrorLoaded || event is PantauLaporanRefreshEvent){
  //     laporan = await PantauLaporan.fetchLaporan (limit: 10);
  //     yield (laporan!. length < 10)
  //       ? PantauLaporanLoaded (laporan: laporan, hasReachedLimit: true)
  //       : PantauLaporanLoaded (laporan: laporan, hasReachedLimit: false);
  //   } else {
  //     if (event is PantauLaporanEvent && state is PantauLaporanLoaded){
  //       PantauLaporanLoaded pantauLoaded = state as PantauLaporanLoaded;
  //       if (state. laporan!.isEmpty){
  //         laporan = await PantauLaporan.fetchLaporan (limit: 10) :
  //       } else {
  //         laporan = await PantauLaporan.fetchlaporan(start: state.laporan!.last.reference, limit: 10);
  //       }
  //       yield(laporan!.isEmpty)
  //       ? pantauLoaded. copyWith(hasReachedLimit: true)
  //       : PantauLaporanLoaded(
  //           laporan: pantauLoaded.laporan! + laporan,
  //           hasReachedLimit: false
  //         );
  //     }
  //   } 
  // } catch(e){
  //   yield PantauLaporanErrorLoaded([], false);
  // }

  void _onRefreshPresenters(RefreshPresentersEvent event, Emitter<PresentersState> emit) async {
    emit(PresentersLoadedState(
      // presenters: event.presenters,
    ));
  }

  void _onUpdatePresenters(UpdatePresentersEvent event, Emitter<PresentersState> emit) async {
    emit(PresentersLoadedState(
      presenters: event.presenters, 
    ));
  }

}

 
