import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_responsive_admin_panel/blocs/bloc.dart';
import 'package:flutter_responsive_admin_panel/blocs/user/user_cubit.dart';
import 'package:flutter_responsive_admin_panel/repositories/firestore/firestore_repo.dart';
 
class AppBloc {
  static final testBloc = TestBloc();
  static final userCubit = UserCubit(); 
  static final applicationCubit = ApplicationCubit(); 
  static final pageBloc = PageBloc();
  static final authBloc = AuthBloc(
    authRepository: AuthFirestore() 
  );

  static final List<BlocProvider> providers = [
    BlocProvider<TestBloc>(
      create: (context) => testBloc
    ),
    BlocProvider<PageBloc>(
      create: (context) => pageBloc..add(LoadPageEvent(1)),
      // create: (context) => TestBloc()..add(LoadTestEvent(widget.num)),

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

    testBloc.close();
  }

  static final AppBloc _instance = AppBloc._internal();

  factory AppBloc(){
    return _instance;
  }

  AppBloc._internal();
}

 