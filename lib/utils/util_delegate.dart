import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_responsive_admin_panel/utils/utils.dart';

class UtilBlocObserver extends BlocObserver {
  ///Support Development
  // @override
  // void onCreate(BlocBase blocBase) { 
  //   super.onCreate(blocBase);
  //   print("BLOC CREATE $blocBase");
  //   UtilLogger.log('BLOC CREATE', blocBase);
  // }

  ///Support Development
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    UtilLogger.log('BLOC ONCHANGE', change);
  }

  ///Support Development
  @override
  void onEvent(Bloc bloc, Object? event) {
    UtilLogger.log('BLOC EVENT', event);
    super.onEvent(bloc, event);
  }

  ///Support Development
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    UtilLogger.log('BLOC ERROR', error);
    super.onError(bloc, error, stackTrace);
  }
  
  ///Support Development 
  @override
  void onTransition(Bloc bloc, Transition transition) {
    UtilLogger.log('BLOC TRANSITION', transition);
    super.onTransition(bloc, transition);
  }

  ///Support Development
  @override
  void onClose(BlocBase cubit) {
    super.onClose(cubit); 
    UtilLogger.log('BLOC CLOSE', cubit);
  } 
}
 