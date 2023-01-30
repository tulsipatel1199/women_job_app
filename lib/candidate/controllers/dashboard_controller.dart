import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:women_job_app/candidate/screens/recruiter_home_screen.dart';

import '../screens/candidate_home_screen.dart';
import '../screens/profile_screen.dart';

class DashboardController extends GetxController{

  RxBool isLoading = true.obs;

  @override
  void onInit(){
    super.onInit();
    getUserType();
  }

  RxInt selectedContent = 0.obs;
  List listOfCandidateScreen = [CandidateHomeScreen(),ProfileScreen()];
  List listOfRecruiterScreen = [RecruiterHomeScreen(),ProfileScreen()];

  final auth = FirebaseAuth.instance;
  final fs = FirebaseFirestore.instance;
  RxBool isCandidate = true.obs;


  getUserType() async{
    try{
      final user = auth.currentUser;
      DocumentSnapshot ds = await fs.collection('users').doc(user!.uid).get();
      isCandidate.value = ds.get('isCandidate');


    }catch(e){
      debugPrint("$e");
    }
  }


}