import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_responsive_admin_panel/blocs/app_bloc.dart';
import 'package:flutter_responsive_admin_panel/configs/config.dart';
import 'package:flutter_responsive_admin_panel/screens/screens.dart';

class FlutterResponsiveAdminPanel extends StatefulWidget {
  const FlutterResponsiveAdminPanel({Key? key}) : super(key: key);

  @override
  State<FlutterResponsiveAdminPanel> createState() => _FlutterResponsiveAdminPanelState();
}

class _FlutterResponsiveAdminPanelState extends State<FlutterResponsiveAdminPanel> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: ConfigApplication.debug,
      theme: ThemeData( 
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider( 
        providers: AppBloc.providers,
        child: const Home(title: 'Flutter Demo Home Page'),
      ),
    );
  } 
}