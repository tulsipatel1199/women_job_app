import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/auth_controllers/auth_controller.dart';
import 'candidate_home_screen.dart';
import 'candidate_login_screen.dart';
class CandidateSignup extends StatelessWidget {
  CandidateSignup({Key? key}) : super(key: key);
  AuthController controller = Get.put(AuthController());
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
               TextField(
                controller: controller.nameCtr.value,

                decoration: InputDecoration(
                    hintText: "Name"
                ),

              ),
              TextField(
                controller:controller.emailCtr.value,
                decoration: InputDecoration(
                    hintText: "Email"
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              TextField(
                controller:controller.passCtr.value,
                decoration: InputDecoration(
                  hintText: "Password",

                ),
                obscureText: true,
              ),
              TextField(
                controller:controller.conPassCtr.value,
                decoration: InputDecoration(
                  hintText: "Confirm Password",

                ),
                obscureText: true,
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(onPressed: (){
                controller.signup();
                // Get.off(()=>CandidateHomeScreen());
                // debugPrint("${controller.nameCtr.value.text} ${controller.emailCtr.value.text}");
              }, child: const Text("Sign up")),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("Already have an account?"),
                  TextButton(onPressed: (){

                    Get.off(()=>CandidateLogin());}, child: const Text("Log In")),
                ],
              ),


            ],
          ),
        ),
      ),

    );
  }
}
