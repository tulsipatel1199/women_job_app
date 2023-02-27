import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../screens/job_details_screen.dart';

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
    debugPrint("no data");
  return const Text('Something went wrong');
  }
  if (snapshot.connectionState == ConnectionState.waiting) {
    debugPrint("loading");
    return const Text("Loading");
  }
  debugPrint("has data");
  return snapshot.data!.docs.toList().isEmpty?Center(child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SvgPicture.asset("assets/default/candidate_empty_state.svg"),
      const SizedBox(height:8),
      const Text("No job post available right now, Please try again later."),
    ],
  )):ListView(
    children: snapshot.data!.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
      return  Padding(
        padding: const EdgeInsets.symmetric(vertical:6.0),
        child: InkWell(
          onTap: (){
            Get.to(()=>JobDetailsScreen(
              title: data['company'],
              role: data['role'],
              tenure: data['tenure'],
              salary: data['salary'],
              description: data['description'],
              recruiterEmail: data['email'],
              phone: data['phone'],
              isCandidate: true,
              receiverId: data['addedBy'],
            ));
          },
          child: Card(
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










// class Job{
//   String company, description,role, salary,tenure, email, phone;
//
//   Job({required this.email,required this.phone,required this.company, required this.description, required this.role, required this.salary, required this.tenure});
// }