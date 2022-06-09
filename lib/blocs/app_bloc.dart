import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_responsive_admin_panel/blocs/application/cubit.dart';
import 'package:flutter_responsive_admin_panel/blocs/auth/auth_bloc.dart';
import 'package:flutter_responsive_admin_panel/blocs/page/page_bloc.dart';
import 'package:flutter_responsive_admin_panel/blocs/user/user_cubit.dart';
import 'package:flutter_responsive_admin_panel/repositories/firestore/firestore_repo.dart';
 
class AppBloc {
  static final userCubit = UserCubit(); 
  static final applicationCubit = ApplicationCubit(); 
  static final pageBloc = PageBloc();
  static final authBloc = AuthBloc(
    authRepository: AuthFirestore() 
  );

  static final List<BlocProvider> providers = [
    BlocProvider<PageBloc>(
      create: (context) => pageBloc
    ),
    BlocProvider<ApplicationCubit>(
      create: (context) => applicationCubit
    ),
    BlocProvider<AuthBloc>( 
      create: (context) => authBloc..add(InitAuth())
    )
  ];

  static void dispose(){
    applicationCubit.close();
    pageBloc.close();
    authBloc.close();
    userCubit.close();
  }

  static final AppBloc _instance = AppBloc._internal();

  factory AppBloc(){
    return _instance;
  }

  AppBloc._internal();
}

 