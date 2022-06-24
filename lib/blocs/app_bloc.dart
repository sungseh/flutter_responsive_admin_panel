import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_responsive_admin_panel/blocs/audios/audios_bloc.dart';
import 'package:flutter_responsive_admin_panel/blocs/bloc.dart';
import 'package:flutter_responsive_admin_panel/blocs/dashboard/dashboard_bloc.dart';
import 'package:flutter_responsive_admin_panel/blocs/user/user_cubit.dart';
import 'package:flutter_responsive_admin_panel/repositories/firestore/firestore_repo.dart'; 
 
class AppBloc {
  static final adminBloc = AdminBloc();
  static final dashboardBloc = DashboardBloc();
  static final usersBloc = UsersBloc(
    usersRepo: UsersFirestore()
  );
  static final subscriptionsBloc = SubscriptionsBloc(
    subscriptionsRepo: SubscriptionsFirestore()
  );
  static final audiosBloc = AudiosBloc(
    audiosRepo: AudioFirestore()
  );
  static final videosBloc = VideosBloc(
    videosRepo: VideoFirestore()
  );
  static final categoriesBloc = CategoriesBloc(
    categoriesRepo: CategoryFirestore()
  );
  static final presentersBloc = PresentersBloc(
    presentersRepo: PresenterFirestore()
  );
  static final testBloc = TestBloc();
  static final userCubit = UserCubit(); 
  static final applicationCubit = ApplicationCubit(); 
  static final pageBloc = PageBloc();
  static final authBloc = AuthBloc(
    authRepository: AuthFirestore() 
  );

  static final List<BlocProvider> providers = [ 
    BlocProvider<UsersBloc>(
      create: (context) => usersBloc
    ),
    BlocProvider<SubscriptionsBloc>(
      create: (context) => subscriptionsBloc
    ),
    BlocProvider<DashboardBloc>(
      create: (context) => dashboardBloc
    ),
    BlocProvider<TestBloc>(
      create: (context) => testBloc
    ),
    BlocProvider<PageBloc>(
      create: (context) => pageBloc..add(const LoadPageNameEvent("Dashboard")),
      // create: (context) => pageBloc..add(LoadPageEvent(1)),
      // create: (context) => TestBloc()..add(LoadTestEvent(widget.num)),
    ),
    BlocProvider<ApplicationCubit>(
      create: (context) => applicationCubit
    ),
    BlocProvider<AuthBloc>( 
      create: (context) => authBloc..add(InitAuthEvent())
    ),
    BlocProvider<AudiosBloc>(
      create: (context) => audiosBloc
    ),
    BlocProvider<VideosBloc>(
      create: (context) => videosBloc
    ),
    BlocProvider<CategoriesBloc>(
      create: (context) => categoriesBloc
    ),
    BlocProvider<PresentersBloc>(
      create: (context) => presentersBloc
    ),
  ];

  static void dispose(){
    subscriptionsBloc.close();
    usersBloc.close();
    dashboardBloc.close();
    applicationCubit.close();
    pageBloc.close();
    authBloc.close();
    audiosBloc.close();
    videosBloc.close();
    categoriesBloc.close();
    presentersBloc.close();
    userCubit.close(); 
    testBloc.close();
  }

  static final AppBloc _instance = AppBloc._internal();

  factory AppBloc(){
    return _instance;
  }

  AppBloc._internal();
}

 