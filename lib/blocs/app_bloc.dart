import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_responsive_admin_panel/blocs/auth/auth_bloc.dart';
import 'package:flutter_responsive_admin_panel/blocs/user/user_cubit.dart';
import 'package:flutter_responsive_admin_panel/controller/menu_controller.dart';
import 'package:flutter_responsive_admin_panel/repositories/firestore/firestore_repo.dart';
 
class AppBloc {
  static final userCubit = UserCubit(); 
  static final authBloc = AuthBloc(
    authRepository: AuthFirestore() 
  );

  static final List<BlocProvider> providers = [
    BlocProvider<AuthBloc>(
      // create: (context) => AuthBloc();
      create: (context) => authBloc..add(InitAuth())
    )
  ];

  static void dispose(){
    authBloc.close();
    userCubit.close();
  }

  static final AppBloc _instance = AppBloc._internal();

  factory AppBloc(){
    return _instance;
  }

  AppBloc._internal();
}

 