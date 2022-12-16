import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:women_job_app/recruiter/screens/recruiter_login_screen.dart';

import '../../candidate/screens/candidate_login_screen.dart';
import 'recruiter_home_screen.dart';
class CandidateSignup extends StatelessWidget {
  const CandidateSignup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric( horizontal: 40),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Please Sign up Candidate"),
              const SizedBox(
                height: 40,
              ),
              const TextField(
                decoration: InputDecoration(
                    hintText: "Name"
                ),

              ),
              const TextField(
                decoration: InputDecoration(
                    hintText: "Email"
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const TextField(
                decoration: InputDecoration(
                  hintText: "Password",

                ),
                obscureText: true,
              ),
              const TextField(
                decoration: InputDecoration(
                  hintText: "Confirm Password",

                ),
                obscureText: true,
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(onPressed: (){
                Get.off(()=>RecruiterHomeScreen());
              }, child: const Text("Sign up")),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("Already have an account?"),
                  TextButton(onPressed: (){Get.off(()=>RecruiterLogin());}, child: const Text("Log In")),
                ],
              ),


            ],
          ),
        ),
      ),

    );
  }
}
