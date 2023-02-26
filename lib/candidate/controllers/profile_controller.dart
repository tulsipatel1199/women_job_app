import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:women_job_app/common/screens/welcome_screen.dart';


class ProfileController extends GetxController{

 final auth = FirebaseAuth.instance;
 final fs = FirebaseFirestore.instance;

 RxString name = "".obs;
 RxString email = "".obs;

 @override
  void onInit(){
   super.onInit();
   getUserDetails();

 }

 getUserDetails() async{
  try{
   final user = auth.currentUser;
   DocumentSnapshot ds = await fs.collection('users').doc(user!.uid).get();
   name.value = ds.get('name');
   email.value = ds.get('email');


   debugPrint("name--->>>${name.value}, email--->>>${email.value}");
  }catch(e){
   debugPrint("$e");
  }
 }

 logout() async{
  try{
   await auth.signOut();
   Get.offAll(()=>const WelcomeScreen());
  }
  catch(e){
   Get.snackbar("Something went wrong",
       "Unable to logout, Try again");
  }
 }
}