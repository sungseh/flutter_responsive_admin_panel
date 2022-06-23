import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_responsive_admin_panel/blocs/app_bloc.dart';
import 'package:flutter_responsive_admin_panel/blocs/bloc.dart';
import 'package:flutter_responsive_admin_panel/configs/configs.dart';
import 'package:flutter_responsive_admin_panel/view/screens/screens.dart';
import 'package:provider/provider.dart';

class FlutterResponsiveAdminPanel extends StatefulWidget {
  const FlutterResponsiveAdminPanel({Key? key}) : super(key: key);

  @override
  State<FlutterResponsiveAdminPanel> createState() => _FlutterResponsiveAdminPanelState();
}

class _FlutterResponsiveAdminPanelState extends State<FlutterResponsiveAdminPanel> {
  @override
  void initState() {
    super.initState();
    AppBloc.applicationCubit.onSetup();
  }

  @override
  void dispose() {
    AppBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Source Admin',
      debugShowCheckedModeBanner: ConfigApplication.debug,
      theme: ThemeData( 
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider( 
        providers: AppBloc.providers, 
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider<AdministratorBloc>(create: (context) => AdministratorBloc()),
          ],
          child: BlocBuilder<ApplicationCubit, ApplicationState>(
            builder: (context, lang) {
              return MaterialApp(
                // supportedLocales: AppLanguage.supportLanguage,
                // onGenerateRoute: Routes.generateRoute,
                // debugShowCheckedModeBanner: Application.debug,
                // locale: lang,
                builder:  (BuildContext context, Widget? child) {
                  return MediaQuery( 
                    data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0), 
                    child: child!,
                  );
                }, 
                home: Scaffold( 
                  body: BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, auth) { 
                      // final ab = context.watch<AdminBloc>();
                      // return ab.isSignedIn == false ? SignIn() : PageControllerWidget();


                      if (auth is UnAuthenticatedState) {  
                        return const SignIn();  
                      } 
                      return const PageControllerWidget();
                    }
                  ),
                ) 
              );
            },
          ),
        )
      )
    );
  } 
}