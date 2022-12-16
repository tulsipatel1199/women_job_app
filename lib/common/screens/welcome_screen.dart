import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../candidate/screens/candidate_login_screen.dart';
import '../../recruiter/screens/recruiter_login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: (){
                debugPrint("helloed!!!!");
                Get.to(()=>const CandidateLogin());
              },
              child: Card(
                color: const Color(0xE2B1F6FF),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 50),
                  child: Column(
                    children: const [
                      Icon(Icons.account_circle,size: 80,),
                      Text("Candidate",style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),),
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: (){
                Get.to(()=>const RecruiterLogin());
              },
              child: Card(
                color: const Color(0xE2B1F6FF),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 50),
                  child: Column(
                    children: const [
                      Icon(Icons.account_circle,size: 80,),
                      Text("Recruiter",style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
