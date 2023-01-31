import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:women_job_app/candidate/controllers/dashboard_controller.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({Key? key}) : super(key: key);

  DashboardController controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Obx(()=>Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          elevation: 5.0,
          onTap: (index){
            controller.selectedContent.value = index;
          },
          currentIndex: controller.selectedContent.value,
          items: [BottomNavigationBarItem(icon: SvgPicture.asset('assets/default/home.svg'),activeIcon: SvgPicture.asset('assets/default/home_filled.svg'), label: "Home"),BottomNavigationBarItem(icon: SvgPicture.asset('assets/default/profile.svg'),activeIcon: SvgPicture.asset('assets/default/profile_filled.svg'), label: "Profile")],
        ),
        body:controller.isCandidate.value?
        controller.listOfCandidateScreen[controller.selectedContent.value]
            :controller.listOfRecruiterScreen[controller.selectedContent.value]
        


      )),
    );
  }
}




