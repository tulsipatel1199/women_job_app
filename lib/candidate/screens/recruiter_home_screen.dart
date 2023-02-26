import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/recruiter_controller.dart';
import 'add_job_screen.dart';

// ignore: must_be_immutable
class RecruiterHomeScreen extends StatelessWidget {
  RecruiterHomeScreen({Key? key}) : super(key: key);
  RecruiterController recruiterController = Get.put(RecruiterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Jobs Posted by You"),
          automaticallyImplyLeading: false,
        ),
      floatingActionButton: SizedBox(
        width: 100,
        child: FloatingActionButton(onPressed: (){
          recruiterController.resetFields();
          Get.to(()=>const AddJobScreen());
        },
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
        child: const Text("Add Job"),
        ),
      ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: const [
              SizedBox(height: 16),
           Expanded(
               child: RecruiterJobsStream()
            ),
            ],
          )
        )
    );
  }
}


