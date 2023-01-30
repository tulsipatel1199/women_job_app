import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:women_job_app/candidate/controllers/dashboard_controller.dart';



// ignore: must_be_immutable
class DashboardScreen extends StatelessWidget {
  DashboardScreen({Key? key}) : super(key: key);

  DashboardController controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Obx(()=>Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index){
            controller.selectedContent.value = index;
          },
          currentIndex: controller.selectedContent.value,
          items: const [BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: "My Profile")],
        ),
        body:controller.isCandidate.value?
        controller.listOfCandidateScreen[controller.selectedContent.value]
            :controller.listOfRecruiterScreen[controller.selectedContent.value]
        


      )),
    );
  }
}




