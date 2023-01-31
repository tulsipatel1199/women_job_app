import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/recruiter_controller.dart';
import '../widgets/add_job_bottom_sheet.dart';

class AddJobScreen extends GetView<RecruiterController> {
  const AddJobScreen({Key? key, this.isUpdate=false}) : super(key: key);
    final bool isUpdate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Job"),
      ),
      bottomNavigationBar:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 16.0),
        child: ElevatedButton(onPressed: (){
          isUpdate?controller.updateJob(Get.arguments[0]):controller.addJob();
        }, child: const Text("Post")),
      ) ,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
        child: AddJobBottomSheet(recruiterController: controller),
      ),

    );
  }
}