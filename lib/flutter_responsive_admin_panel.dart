import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_responsive_admin_panel/blocs/app_bloc.dart';
import 'package:flutter_responsive_admin_panel/blocs/bloc.dart';
import 'package:flutter_responsive_admin_panel/configs/configs.dart';
import 'package:flutter_responsive_admin_panel/view/screens/screens.dart';

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
              // theme: theme(),
              // localizationsDelegates: const [
              //   Translate.delegate,
              //   GlobalMaterialLocalizations.delegate,
              //   GlobalWidgetsLocalizations.delegate,
              //   GlobalCupertinoLocalizations.delegate,  
              // ],
              home: Scaffold( 
                body: BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, auth) { 
                    // if (auth == UnAuthenticated) {  
                    //   return const SignIn();  
                    // } 
                    return const PageControllerWidget();
                  }
                ),
              ) 
            );
          },
        ),
      

      /*
      home: MultiBlocProvider( 
        providers: AppBloc.providers,
        child: PageControllerWidget(),

        // child: BlocBuilder<AuthBloc, AuthState>(
        //   builder: (context, authentication) {
        //     final authenticated = authentication is! UnAuthenticated;  
        //     return Scaffold( 
        //       body: Container(
        //         color: Colors.red,
        //       )
        //     ); 
        //   },
        // )

        // child: BlocBuilder<AuthBloc, AuthState>(
        //   builder: (context, auth){
        //     return PageControllerWidget(); 
        //     // if (auth  is UnAuthenticated){
        //     //   // return const SignIn();
        //     //   return Container(
        //     //     height: 200,
        //     //     width: 300,
        //     //     color: Colors.red,
        //     //   );
        //     // }
        //     // // return const PageControllerWidget();
        //     // return Container(
        //     //   height: 200,
        //     //   width: 300,
        //     //   color: Colors.blue,
        //     // );
        //   }
        // )



        // body: BlocBuilder<ApplicationCubit, ApplicationState>(
        //   builder: (context, application) { 
        //     if (application == ApplicationState.completed) {  
        //       return const Navigation();  
        //     }
        //     if (application == ApplicationState.intro) {
        //       return const Welcome(); 
        //     }
        //     return const SplashScreen();
        //   }
        // ),
      ),
      */
      )
    );
  } 
}