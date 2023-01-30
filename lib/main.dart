import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:women_job_app/candidate/screens/splash_screen.dart';
import 'package:women_job_app/common/auth_controllers/auth_gate.dart';

import 'common/styles/app_themes.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

      title: 'Women\'s job app',
      theme: AppThemes.themeData,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}



