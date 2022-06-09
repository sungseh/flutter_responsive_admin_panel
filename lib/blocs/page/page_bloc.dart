import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'page_event.dart';
part 'page_state.dart';

// class PageBloc extends Bloc<PageEvent, PageState> {
//   PageBloc() : super(PageInitial()) {
//     on<PageEvent>((event, emit) {
//       // TODO: implement event handler
//     });
//   }
// }


class PageBloc extends Bloc<PageEvent, PageState> {
  PageBloc() : super(PageInitial()) {
    on<LoadPageEvent>((event, emit) {
      if (event is LoadPageEvent){
        emit(PageLoadedState(event.number + 1));
      }
    });
  }
}




// // class PageBloc extends Bloc<PageEvent, PageState> {
// //   PageBloc() : super(PageInitial()) {
// //     on<PageEvent>((event, emit) {
// //       // TODO: implement event handler
// //     });
// //   }
// // }

 
 
// class PageBloc extends Bloc<PageEvent, PageState> { 
//   // final AudioFirebaseRepository? _audiosRepo;
//   // StreamSubscription? _audiosSub;  
 
//   PageBloc() : super(PageInitial()) {
//     on<ClickTab>(_onClickTab);
//     // on<UpdateAudios>(_onUpdateAudios);
//   }

//   void _onClickTab(ClickTab event, Emitter<PageState>  emit){
//     emit(PageClicked(
//       event.name
//     ));

//   }

//   // void _onLoadAudios(LoadAudios event, Emitter<AudiosState> emit) async {
//   //   emit(AudiosLoading());
//   //   _audiosSub?.cancel();
//   //   _audiosSub = _audiosRepo?.audios()
//   //     .listen((audios) => add(UpdateAudios(audios))); 
//   // }

//   // void _onUpdateAudios(UpdateAudios event, Emitter<AudiosState> emit) async {
//   //   emit(AudiosLoaded( 
//   //     audios: event.audios, 
//   //   ));
//   // }
// }

 
