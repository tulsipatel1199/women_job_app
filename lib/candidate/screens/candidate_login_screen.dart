import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'candidate_home_screen.dart';
import 'candidate_signup_screen.dart';
class CandidateLogin extends StatelessWidget {
  const CandidateLogin({Key? key}) : super(key: key);

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
              const Text("Please Login Candidate"),
              const SizedBox(
                height: 40,
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
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(onPressed: (){
                Get.off(()=>CandidateHomeScreen());
              }, child: const Text("Log In")),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("Don't have an account?"),
                  TextButton(onPressed: (){Get.off(()=>CandidateSignup());}, child: const Text("Sign Up")),
                ],
              ),


            ],
          ),
        ),
      ),

    );
  }
}
