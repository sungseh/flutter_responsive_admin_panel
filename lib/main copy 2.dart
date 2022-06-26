// import 'dart:io';

// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:flutter_responsive_admin_panel/configs/configs.dart';
// import 'package:flutter_responsive_admin_panel/utils/utils.dart';
// import 'view/screens/upload/upload.dart';

// Future<void> main() async {
//   await Firebase.initializeApp();

//   WidgetsFlutterBinding.ensureInitialized(); 
//   await dotenv.load(
//     fileName: ConfigEnvironment.filename
//   );
 
//   // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom, SystemUiOverlay.top]);

//   BlocOverrides.runZoned(
//     blocObserver: UtilBlocObserver(),
//     // () => runApp(const FlutterResponsiveAdminPanel()),
//     () => runApp(const MyApp()),
//   );
// }


// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   final String title;
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// } 

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: UploadPage(),
//     );
//   }
// }
 