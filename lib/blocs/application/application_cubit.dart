
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_responsive_admin_panel/blocs/application/cubit.dart';
import 'package:flutter_responsive_admin_panel/configs/configs.dart';
import 'package:flutter_responsive_admin_panel/utils/utils.dart';
// import 'package:firebase_core/firebase_core.dart';  

class ApplicationCubit extends Cubit<ApplicationState> {
  ApplicationCubit() : super(ApplicationState.loading);

  ///On Setup Application
  void onSetup() async {
    ///Notify loading
    emit(ApplicationState.loading);

    ///Firebase init
    // await Firebase.initializeApp();

    ///Setup SharedPreferences
    await ConfigPreferences.setPreferences(); 
 
    // final oldLanguage = UtilPreferences.getString(ConfigPreferences.language); 
   
    ///Setup Language
    // if (oldLanguage != null) {
    //   AppBloc.languageCubit.onUpdate(Locale(oldLanguage));
    // }
     
    ///Authentication begin check
    // await AppBloc.authenticateCubit.onCheck();
    // AppBloc.authBloc.onInitAuth;
 

    ///First or After upgrade version show intro preview app
    final hasReview = UtilPreferences.containsKey(
      '${ConfigPreferences.reviewIntro}.${ConfigPreferences.version}',
    );
    if (hasReview) {
      ///Notify
      emit(ApplicationState.completed);
    } else {
      ///Notify
      emit(ApplicationState.intro);
    }
  }

  ///On Complete Intro
  void onCompletedIntro() async {
    await UtilPreferences.setBool(
      '${ConfigPreferences.reviewIntro}.${ConfigPreferences.version}',
      true,
    );

    ///Notify
    emit(ApplicationState.completed);
  }
}
