import 'package:flutter/material.dart';
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
      theme: ThemeData( 
        primarySwatch: Colors.blue,
      ),
      home: const Home(title: 'Flutter Demo Home Page'),
    );
  } 
}