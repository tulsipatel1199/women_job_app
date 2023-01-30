import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../screens/candidate_job_details_screen.dart';

class HomeController extends GetxController {


  String subject = "This email is regarding your recent job post.";
  String message = "Msg";
  void sendEmail(String email) async {
    var url =
        "https://mail.google.com/mail/?view=cm&to=$email&su=$subject&body=$message";
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw "Could not launch $url";
    }
  }

  // //function
  // RxList<Job> jobsList = <Job>[].obs;
  //
  // getJobOpenings() async {
  //   final QuerySnapshot qs = await fs.collection('jobs').get();
  //   // debugPrint("qs--->>>${qs.docs[0].get('description')}");
  //   for (int i = 0; i < qs.size; i++) {
  //     // jobs.add(qs.docs[i].get('title'));
  //     jobsList.add(Job(company: qs.docs[i].get('company'),
  //         description: qs.docs[i].get('description'),
  //         tenure: qs.docs[i].get('tenure'),
  //         salary: qs.docs[i].get('salary'),
  //         role: qs.docs[i].get('role')));
  //   }
  //
  //   debugPrint("${jobsList[0].description}");
  // }
}


  final _firestore = FirebaseFirestore.instance;

  class JobsStream extends StatelessWidget {
  const JobsStream({super.key});

  @override
  Widget build(BuildContext context) {
  return StreamBuilder<QuerySnapshot>(
  stream: _firestore
      .collection('jobs')
      .snapshots(),
  builder: (context, snapshot) {
  if (!snapshot.hasData) {
  return const Text('Something went wrong');
  }
  if (snapshot.connectionState == ConnectionState.waiting) {
  return const Text("Loading");
  }
  return ListView(
    children: snapshot.data!.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
      return  Padding(
        padding: const EdgeInsets.symmetric(vertical:6.0),
        child: InkWell(
          onTap: (){
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Company Name : ${data['company']}",style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                  Text("Salary: ${data['salary']}"),
                  Text("Tenure: ${data['tenure']} "),
                  Text("Job description:  ${data['description']}",
                    maxLines: 2,
                    overflow: TextOverflow.fade,
                  ),

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










class Job{
  String company, description,role, salary,tenure, email;

  Job({required this.email,required this.company, required this.description, required this.role, required this.salary, required this.tenure});
}