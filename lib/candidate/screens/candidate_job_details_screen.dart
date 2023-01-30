
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:women_job_app/candidate/controllers/home_controller.dart';


// ignore: must_be_immutable
class CandidateJobDetailsScreen extends StatelessWidget {
  CandidateJobDetailsScreen({Key? key,
    required this.title,
    required this.role,
    required this.salary,
    required this.tenure,
    required this.description,
    required this.recruiterEmail,
  }) : super(key: key);
  String title;
  String role;
  String salary;
  String tenure;
  String description;
  String recruiterEmail;
  HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(child: const Icon(Icons.email),onPressed: (){
        controller.sendEmail(recruiterEmail);
      },),
      bottomNavigationBar:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 16.0),
        child: ElevatedButton(onPressed: (){
          Get.snackbar("Coming Soon", "");
        }, child: const Text("Chat with us")),
      ) ,
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
           // ElevatedButton(onPressed: (){}, child: Text("Contact us")),
          ],
        ),
      ),

    );
  }
}


fun(String str){
  debugPrint(str);
}