import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:women_job_app/candidate/controllers/home_controller.dart';


class JobDetailsScreen extends StatelessWidget {
  JobDetailsScreen({Key? key,
    required this.title,
    required this.role,
    required this.salary,
    required this.tenure,
    required this.description,
    required this.recruiterEmail,
    required this.phone,
    required this.isCandidate,
    required this.receiverId,
  }) : super(key: key);
  String title;
  String role;
  String salary;
  String tenure;
  String description;
  String recruiterEmail;
  String phone;
  bool isCandidate;
  String receiverId;

  HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      floatingActionButton: isCandidate?FloatingActionButton(child: const Icon(Icons.email),onPressed: (){
        debugPrint(recruiterEmail);
        controller.sendEmail(recruiterEmail);
      },):null,
      bottomNavigationBar:isCandidate?Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 16.0),
        child: ElevatedButton(onPressed: (){
          launchUrl(Uri.parse("https://wa.me/$phone?text=Hello there!"),mode: LaunchMode.externalApplication);
          // Get.to(()=>ChatScreen(pageTitle: title,receiverId: receiverId));
        }, child: const Text("Chat in Whatsapp")),
      ):null,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Company Name: $title",style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
            Text("Salary: $salary"),
            Text("Role: $role"),
            Text("Tenure: $tenure"),
           // Text("Uid: $recruiterEmail"),
            const SizedBox(height: 30),
            Text("Job description: $description"),
          ],
        ),
      ),

    );
  }
}
