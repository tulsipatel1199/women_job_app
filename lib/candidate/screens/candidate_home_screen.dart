import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:women_job_app/candidate/controllers/home_controller.dart';
import 'chat_screen.dart';


class CandidateHomeScreen extends StatelessWidget {
   CandidateHomeScreen({
    Key? key,
  }) : super(key: key);
HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Job openings"),
        automaticallyImplyLeading: false,
        actions: [
          InkWell(
            onTap: (){
              Get.to(()=>ChatScreen());
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset('assets/default/chat.svg'),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          //mainAxisSize: MainAxisSize.min,
          children:  const [
            // const TextField(
            //   decoration: InputDecoration(hintText: "Search here",
            //     border: OutlineInputBorder( ),
            //     prefixIcon: Icon(Icons.search),
            //
            //   ),
            // ),
        SizedBox(height: 20),
            Expanded(child: JobsStream()),





          ],
        ),
      ),
    );
  }
}
