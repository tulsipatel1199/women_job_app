import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
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
        Center(child: Text(isCandidateLogin?"Welcome Back! Login as Candidate":"Welcome Back! Login as Recruiter", style: Theme.of(context).textTheme.titleMedium, textAlign: TextAlign.justify)),
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
        Obx(()=>TextField(
          controller: authController.passCtr.value,
          decoration: InputDecoration(
              hintText: "Password",
              suffixIcon: IconButton(onPressed:(){
                debugPrint(authController.hidePassword.value.toString());
                authController.hidePassword.value=!authController.hidePassword.value;
              },icon: authController.hidePassword.value?const Icon(Icons.remove_red_eye_outlined):const Icon(Icons.remove_red_eye_sharp))
          ),
          obscureText: authController.hidePassword.value,
        ),),
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
