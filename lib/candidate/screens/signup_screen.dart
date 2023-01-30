import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/auth_controllers/auth_controller.dart';
import 'login_screen.dart';
// ignore: must_be_immutable
class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key, required this.isCandidateSignup}) : super(key: key);
  AuthController controller = Get.put(AuthController());
  bool isCandidateSignup;
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
              const Text("Please Sign up"),
              const SizedBox(
                height: 40,
              ),
               TextField(
                controller: controller.nameCtr.value,
                decoration: const InputDecoration(
                    hintText: "Name"
                ),
              ),
              TextField(
                controller:controller.emailCtr.value,
                decoration: const InputDecoration(
                    hintText: "Email"
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              TextField(
                controller:controller.passCtr.value,
                decoration: const InputDecoration(
                  hintText: "Password",

                ),
                obscureText: true,
              ),
              TextField(
                controller:controller.conPassCtr.value,
                decoration: const InputDecoration(
                  hintText: "Confirm Password",

                ),
                obscureText: true,
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(onPressed: (){
                controller.signup(isCandidateSignup);
              }, child: const Text("Sign up")),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("Already have an account?"),
                  TextButton(onPressed: (){
                    Get.off(()=>LoginScreen(isCandidateLogin: isCandidateSignup));}, child: const Text("Log In")),
                ],
              ),


            ],
          ),
        ),
      ),

    );
  }
}
