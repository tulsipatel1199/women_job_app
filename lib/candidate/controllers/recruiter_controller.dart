import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:women_job_app/candidate/screens/add_job_screen.dart';

import '../screens/candidate_job_details_screen.dart';

final user = FirebaseAuth.instance;

class RecruiterController extends GetxController{

  Rx<TextEditingController> companyNameCtr = TextEditingController().obs;
  Rx<TextEditingController> roleCtr = TextEditingController().obs;
  Rx<TextEditingController> salaryCtr = TextEditingController().obs;
  Rx<TextEditingController> tenureCtr = TextEditingController().obs;
  Rx<TextEditingController> descriptionCtr = TextEditingController().obs;



  // RxList<Job> myAddedJobs = <Job>[].obs;
  //
  // getJob() async {
  //   final fs = FirebaseFirestore.instance;
  //  QuerySnapshot qs = await fs.collection('jobs').where('addedBy',isEqualTo: user.currentUser!.uid).get();
  //  myAddedJobs.clear();
  //  for(int i=0;i<qs.size;i++)
  //  {
  //     myAddedJobs.add(Job(
  //         company: qs.docs[i].get('company'),
  //         description: qs.docs[i].get('description'),
  //         salary: qs.docs[i].get('salary'),
  //         role: qs.docs[i].get('role'),
  //         tenure: qs.docs[i].get('tenure'),
  //         email: qs.docs[i].get('email'),
  //     ));
  //   }
  // }
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
      Get.back();
    }

    else{

      debugPrint("is empty");
      Get.snackbar("Please enter something", " ");
    }
  }

  deleteJob(String id){
    final fs = FirebaseFirestore.instance;
    fs.collection('jobs').doc(id).delete();
    debugPrint("deleted");
    Get.back();
  }

  updateJob(String id){
    final fs = FirebaseFirestore.instance.collection('jobs').doc(id).update(
        {
          'company': companyNameCtr.value.text,
          'role': roleCtr.value.text,
          'salary': salaryCtr.value.text,
          'tenure': tenureCtr.value.text,
          'description': descriptionCtr.value.text,
          'addedAt':DateTime.now(),
          'addedBy': user.currentUser!.uid,
          'email':user.currentUser!.email,
        });
    Get.back();
  }

  resetFields(){
    companyNameCtr.value.clear();
    roleCtr.value.clear();
    salaryCtr.value.clear();
    tenureCtr.value.clear();
    descriptionCtr.value.clear();
  }
}


final _firestore = FirebaseFirestore.instance;

class RecruiterJobsStream extends GetView<RecruiterController> {
  const RecruiterJobsStream({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore
          .collection('jobs').where('addedBy',isEqualTo: user.currentUser!.uid)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/default/recruiter_empty_state.svg"),
              SizedBox(height:8),
              Text("No jobs has been added by you!"),
            ],
          ));
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }
        return snapshot.data!.docs.length==0?Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/default/recruiter_empty_state.svg"),
              SizedBox(height:8),
              Text("No jobs has been added by you!"),
            ],
          ),
        ):ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
            return  Padding(
              padding: const EdgeInsets.symmetric(vertical:6.0),
              child: InkWell(
                onTap: (){
                  debugPrint("${document.id}");
                  Get.to(()=>CandidateJobDetailsScreen(
                    title: data['company'],
                    role: data['role'],
                    tenure: data['tenure'],
                    salary: data['salary'],
                    description: data['description'],
                    recruiterEmail: data['email'],
                  ));
                },
                child: Card(
                  //decoration: BoxDecoration(borderRadius : BorderRadius.circular(8),color: Colors.cyan),
                  child:
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${data['role']}",style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                              Text("${data['company']}"),
                              Text("Salary: ${data['salary']}"),
                              Text("Tenure: ${data['tenure']} "),
                              Text("Job description:  ${data['description']}",
                                maxLines: 2,
                                overflow: TextOverflow.fade,
                              ),

                            ],
                          ),
                        ),
                        InkWell(
                            onTap:(){
                              Get.bottomSheet(Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      InkWell(
                                          onTap:(){
                                            controller.companyNameCtr.value.text = data['company'];
                                            controller.roleCtr.value.text = data['role'];
                                            controller.salaryCtr.value.text = data['salary'];
                                            controller.tenureCtr.value.text = data['tenure'];
                                            controller.descriptionCtr.value.text = data['description'];
                                            Get.back();
                                            Get.to(()=>AddJobScreen(isUpdate: true), arguments: [document.id]);
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Icon(Icons.edit),
                                                SizedBox(width: 8),
                                                Text("Edit"),
                                              ],
                                            ),
                                          )),
                                      Divider(),
                                      InkWell(
                                          onTap:(){
                                                RecruiterController().deleteJob(document.id);
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Icon(Icons.delete),
                                                SizedBox(width: 8),
                                                Text("Delete"),
                                              ],
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                              ));
                            },
                            child: Icon(Icons.more_vert)),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}