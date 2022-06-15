import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';


part 'page_event.dart';
part 'page_state.dart';
 
class PageBloc extends Bloc<PageEvent, PageState> {
  PageBloc() : super(PageInitial()) {
    on<LoadPageEvent>(_onLoadedPageEvent);
    on<LoadPageNameEvent>(_onLoadedPageName);
    // on<LoadPageEvent>((event, emit) {
    //   if (event is LoadPageEvent){
    //     emit(PageLoadedState(event.number + 1));
    //   }
    // });
  }

  void _onLoadedPageEvent(LoadPageEvent event, Emitter<PageState> emit) async {
    emit(PageLoadedState(event.number + 1));
  }

  void _onLoadedPageName(LoadPageNameEvent event, Emitter<PageState> emit) async {
    emit(PageNameLoadedState(event.pageName));
    // switch (event.pageName) {
    //   case "Audios":
    //     emit(LoadAudios());
        
    //     break;
    //   default:
    // }
  }
}

 