import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:women_job_app/common/auth_controllers/auth_controller.dart';
import '../../common/screens/common_base_screen.dart';
import 'signup_screen.dart';
// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key, required this.isCandidateLogin}) : super(key: key);
  bool isCandidateLogin;
  AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return CommonBaseScreen(
      child: ListView(
        shrinkWrap: true,
      children: [
        Center(child: Text("Welcome Back!", style: Theme.of(context).textTheme.titleMedium)),
        const SizedBox(
          height: 40,
        ),
        TextField(
          controller: authController.emailCtr.value,
          decoration: const InputDecoration(
              hintText: "Email"
          ),
          keyboardType: TextInputType.emailAddress,
        ),
        TextField(
          controller: authController.passCtr.value,
          decoration: const InputDecoration(
            hintText: "Password",
          ),
          obscureText: true,
        ),
        const SizedBox(
          height: 40,
        ),
        ElevatedButton(onPressed: (){
          authController.login(isCandidateLogin);
        }, child: const Text("Log In")),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Don't have an account?"),
            TextButton(onPressed: (){

              Get.off(()=>SignupScreen(isCandidateSignup: isCandidateLogin));

            }, child: const Text("Sign Up")),
          ],
        ),


      ],
    ),

    );
  }
}
