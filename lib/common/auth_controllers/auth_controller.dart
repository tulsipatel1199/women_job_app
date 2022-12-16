import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{
  final auth = FirebaseAuth.instance;

  Rx<TextEditingController> nameCtr = TextEditingController().obs;
  Rx<TextEditingController> emailCtr = TextEditingController().obs;
  Rx<TextEditingController> passCtr = TextEditingController().obs;
  Rx<TextEditingController> conPassCtr = TextEditingController().obs;






  signup() async {
    if(nameCtr.value.text.isNotEmpty&&emailCtr.value.text.isNotEmpty&&passCtr.value.text.isNotEmpty&&conPassCtr.value.text.isNotEmpty){
      debugPrint("you are good to go!");

      if(passCtr.value.text.length>=6){
        if(passCtr.value.text == conPassCtr.value.text){
          debugPrint("matching password!");
          try{
            await auth.createUserWithEmailAndPassword(email: emailCtr.value.text, password: passCtr.value.text);
          }
          catch(e){

            debugPrint("error");
          }


        }else{
          debugPrint("please enter matching pass");
        }
      }else{debugPrint("error!!! please enter 6 digit");}


    }
    else{
      debugPrint("error!!! please enter something");
    }
  }


}

