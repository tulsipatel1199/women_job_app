import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/auth_controllers/auth_controller.dart';
import '../../common/screens/common_base_screen.dart';
import 'login_screen.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key, required this.isCandidateSignup}) : super(key: key);
  AuthController controller = Get.put(AuthController());
  bool isCandidateSignup;
  @override
  Widget build(BuildContext context) {
    return CommonBaseScreen(
      child: ListView(
        shrinkWrap: true,
        children: [
          Center(child: Text(isCandidateSignup?"Register yourself as Candidate!":"Register yourself as Recruiter!", style: Theme.of(context).textTheme.titleMedium, textAlign: TextAlign.justify)),
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
            controller:controller.phoneCtr.value,
            decoration: const InputDecoration(
                hintText: "Phone (With Country Code)"
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          Obx(()=>TextField(
            controller:controller.passCtr.value,
            decoration: InputDecoration(
                hintText: "Password",
                suffixIcon: IconButton(onPressed:(){
                  debugPrint(controller.hidePassword.value.toString());
                  controller.hidePassword.value=!controller.hidePassword.value;
                },icon: controller.hidePassword.value?const Icon(Icons.remove_red_eye_outlined):const Icon(Icons.remove_red_eye_sharp))
            ),
            obscureText: true,
          ),),
          Obx(()=>TextField(
            controller:controller.conPassCtr.value,
            decoration: InputDecoration(
                hintText: "Confirm Password",
                suffixIcon: IconButton(onPressed:(){
                  debugPrint(controller.hidePassword.value.toString());
                  controller.hidePassword.value=!controller.hidePassword.value;
                },icon: controller.hidePassword.value?const Icon(Icons.remove_red_eye_outlined):const Icon(Icons.remove_red_eye_sharp))
            ),
            obscureText: true,
          ),),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton(onPressed: (){
            controller.signup(isCandidateSignup);
          }, child: const Text("Sign up")),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Already have an account?"),
              TextButton(onPressed: (){
                Get.off(()=>LoginScreen(isCandidateLogin: isCandidateSignup));}, child: const Text("Log In")),
            ],
          ),


        ],
      ),
    );
  }
}
