import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_responsive_admin_panel/configs/configs.dart';
import 'package:flutter_responsive_admin_panel/flutter_responsive_admin_panel.dart';
import 'package:flutter_responsive_admin_panel/utils/utils.dart';

Future<void> main() async {
  await Firebase.initializeApp();

  WidgetsFlutterBinding.ensureInitialized(); 
  await dotenv.load(
    fileName: ConfigEnvironment.filename
  );
 
  // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom, SystemUiOverlay.top]);

  BlocOverrides.runZoned(
    blocObserver: UtilBlocObserver(),
    () => runApp(const FlutterResponsiveAdminPanel()),
  );
}

 