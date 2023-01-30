import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:women_job_app/candidate/controllers/home_controller.dart';

class RecruiterController extends GetxController{

  final user = FirebaseAuth.instance;


  Rx<TextEditingController> companyNameCtr = TextEditingController().obs;
  Rx<TextEditingController> roleCtr = TextEditingController().obs;
  Rx<TextEditingController> salaryCtr = TextEditingController().obs;
  Rx<TextEditingController> tenureCtr = TextEditingController().obs;
  Rx<TextEditingController> descriptionCtr = TextEditingController().obs;

  @override
  void onInit(){
    super.onInit();
    getJob();

  }

  RxList<Job> myAddedJobs = <Job>[].obs;

  getJob() async {
    final fs = FirebaseFirestore.instance;
   QuerySnapshot qs = await fs.collection('jobs').where('addedBy',isEqualTo: user.currentUser!.uid).get();
   myAddedJobs.clear();
   for(int i=0;i<qs.size;i++)
   {
      myAddedJobs.add(Job(
          company: qs.docs[i].get('company'),
          description: qs.docs[i].get('description'),
          salary: qs.docs[i].get('salary'),
          role: qs.docs[i].get('role'),
          tenure: qs.docs[i].get('tenure'),
          email: qs.docs[i].get('email'),
      ));
    }


  }


  addJob(){
    final fs = FirebaseFirestore.instance;
    if(companyNameCtr.value.text.isNotEmpty&&roleCtr.value.text.isNotEmpty&&salaryCtr.value.text.isNotEmpty&&tenureCtr.value.text.isNotEmpty&&
        descriptionCtr.value.text.isNotEmpty&&user.currentUser!.uid.isNotEmpty&&user.currentUser!.email!.isNotEmpty){

      fs.collection('jobs').add({
        'company': companyNameCtr.value.text,
        'role': roleCtr.value.text,
        'salary': salaryCtr.value.text,
        'tenure': tenureCtr.value.text,
        'description': descriptionCtr.value.text,
        'addedAt':DateTime.now(),
        'addedBy': user.currentUser!.uid,
        'email':user.currentUser!.email,
      });

      resetFields();
      getJob();
      Get.back();
    }

    else{

      debugPrint("is empty");
      Get.snackbar("Please enter something", " ");
    }


  }

  resetFields(){
    companyNameCtr.value.clear();
    roleCtr.value.clear();
    salaryCtr.value.clear();
    tenureCtr.value.clear();
    descriptionCtr.value.clear();
  }



}


