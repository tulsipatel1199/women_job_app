import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:women_job_app/candidate/screens/dashboard_screen.dart';

class AuthController extends GetxController{
  final auth = FirebaseAuth.instance;

  Rx<TextEditingController> nameCtr = TextEditingController().obs;
  Rx<TextEditingController> emailCtr = TextEditingController().obs;
  Rx<TextEditingController> passCtr = TextEditingController().obs;
  Rx<TextEditingController> conPassCtr = TextEditingController().obs;



  signup(bool isCandidate) async {
    if(nameCtr.value.text.isNotEmpty&&emailCtr.value.text.isNotEmpty&&passCtr.value.text.isNotEmpty&&conPassCtr.value.text.isNotEmpty){
      if(passCtr.value.text.length>=6){
        if(passCtr.value.text == conPassCtr.value.text){
          try{
           final user = await auth.createUserWithEmailAndPassword(email: emailCtr.value.text, password: passCtr.value.text);
        final fs = FirebaseFirestore.instance;
          fs.collection('users').doc(user.user!.uid).set({
            'name':nameCtr.value.text,
           'email':emailCtr.value.text,
            'isCandidate':isCandidate,
         });
            Get.off(()=>DashboardScreen());
          }
          catch(e){
              Get.snackbar("Email already in use", "The email address is already in use by another account.");
          }

        }else{
          debugPrint("please enter matching pass");
          Get.snackbar("Please enter matching pass", "Your password and confirm password did not match, Try again");
        }
      }else{debugPrint
        ("error!!! please enter 6 digit");
        Get.snackbar("Enter 6 digit password", "Enter 6 digit passowrd");
      }
    }
    else{
      debugPrint("error!!! please enter something");
      Get.snackbar("Please enter all details", "Please enter all details");
    }
  }
  login(bool isCandidate) async {
    if(emailCtr.value.text.isNotEmpty && passCtr.value.text.isNotEmpty){
      try{
        final user = await auth.signInWithEmailAndPassword(email: emailCtr.value.text, password: passCtr.value.text);
        final fs = FirebaseFirestore.instance;
        DocumentSnapshot ds = await fs.collection('users').doc(user.user!.uid).get();
        if(ds.get('isCandidate')==isCandidate){
             Get.off(()=>DashboardScreen());

             // User? user = userCredential.user;
             String token = await user.user!.getIdToken(true);
             debugPrint("token:$token");
             final store = GetStorage();
             await store.write("token", token);

        }else{
          auth.signOut();
          Get.back();
          isCandidate?
          Get.snackbar("User already registered as Recruiter", "")
              :Get.snackbar("User already registered as Candidate", "");
        }
      }

      catch(e){
        //if(e.hashCode == 375378367) {
          Get.snackbar("Wrong email or password",
              "You may have entered wrong email or password");
        //}


      }
    }
    else{
      debugPrint("please enter email and pass");
      Get.snackbar("Please enter email ans password",
          "Your email and password is empty");
    }
  }


}



