import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:women_job_app/common/auth_controllers/auth_gate.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4),(){
      Get.offAll(const AuthGate());
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color(0xffFFF3E8),
      body: Center(child: Image.asset('assets/default/logo.png')),
      //body: Center(child: SvgPicture.asset('assets/default/logo.svg')),
    );
  }
}
