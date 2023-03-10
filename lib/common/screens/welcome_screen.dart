import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../candidate/screens/login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Spacer(),
            InkWell(
              onTap: (){
                Get.to(()=> LoginScreen(isCandidateLogin: true));
              },
              child: SvgPicture.asset("assets/default/Candidate.svg"),
            ),
            const Text("Candidate",style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),),
            const SizedBox(height: 50,),
            InkWell(
              onTap: (){
                Get.to(()=> LoginScreen(isCandidateLogin: false));
              },
              child: SvgPicture.asset("assets/default/Recruter.svg"),
            ),
            const Text("Recruiter",style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
