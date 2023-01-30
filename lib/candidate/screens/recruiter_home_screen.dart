import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:women_job_app/candidate/controllers/recruiter_controller.dart';

// ignore: must_be_immutable
class RecruiterHomeScreen extends StatelessWidget {
  RecruiterHomeScreen({Key? key}) : super(key: key);
  RecruiterController recruiterController = Get.put(RecruiterController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Your added jobs"),
            automaticallyImplyLeading: false,
            actions:  [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: InkWell(
                    onTap:(){
                      Get.snackbar("Coming soon!", " ");
                    },
                    child: Icon(Icons.chat_bubble),

                ),
              ),
            ],
          ),
        floatingActionButton: FloatingActionButton(onPressed: (){
          recruiterController.resetFields();
          Get.bottomSheet(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(16),topLeft: Radius.circular(16))),
              Container(
                decoration:BoxDecoration(color: Colors.white,borderRadius: BorderRadius.only(topRight: Radius.circular(16),topLeft: Radius.circular(16)) ),


              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  children: [
                    const Text("Add Job Details", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),

                    CustomTextField(controller:recruiterController.companyNameCtr.value , title: 'Job role',),
                    CustomTextField(controller:recruiterController.roleCtr.value , title: 'Company',),

                    CustomTextField(controller:recruiterController.salaryCtr.value , title: 'Salary (LPA)',),
                    CustomTextField(controller:recruiterController.tenureCtr.value , title: 'Tenure',),
                    CustomTextField(controller:recruiterController.descriptionCtr.value , title: 'Description',),

                    // const Text("tenure"),
                    // TextField(controller: recruiterController.tenureCtr.value),
                    // const Text("Description"),
                    // TextField(controller: recruiterController.descriptionCtr.value),
                    ElevatedButton(onPressed: (){

                      recruiterController.addJob();


                    }, child: const Text("Save"))
                  ],
                ),
              ),
              ));





        },child: const Icon(Icons.add),),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: recruiterController.myAddedJobs.isNotEmpty?Column(
              //mainAxisSize: MainAxisSize.min,
              children:  [
                // TextField(
                //   decoration: InputDecoration(hintText: "Search here",
                //     border: OutlineInputBorder( ),
                //
                //     prefixIcon: Icon(Icons.search),
                //
                //   ),
                // ),
                const SizedBox(height: 16),
               Obx(()=> Expanded(
                 child: ListView.builder(
                     itemCount: recruiterController.myAddedJobs.length,
                     itemBuilder: (context, i){
                       return Padding(
                         padding: const EdgeInsets.only(bottom: 8.0),
                         child: InkWell(
                           onTap: (){
                             // Get.to(()=>CandidateJobDetailsScreen());
                           },
                           child: Card(
                             //decoration: BoxDecoration(borderRadius : BorderRadius.circular(8),color: Colors.cyan),
                             child:
                             Padding(
                               padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 16),
                               child: Column(
                                 // mainAxisSize: MainAxisSize.min,
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Text(recruiterController.myAddedJobs[i].company,style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                   Text("Salary: ${recruiterController.myAddedJobs[i].salary}LPA"),
                                   Text("Tenure: ${recruiterController.myAddedJobs[i].tenure} "),
                                   Text("Job description: ${recruiterController.myAddedJobs[i].description}"),

                                 ],
                               ),
                             ),
                           ),
                         ),
                       );
                     }),
               ),),




              ],
            ):Text("No jobs added by you!"),
          )
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
   CustomTextField({
    Key? key,
    required this.title,
    required this.controller,
  }) : super(key: key);

   TextEditingController controller;
  String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),

          TextField(
              controller: controller,
            decoration: InputDecoration(
            ),
          ),
        ],
      ),
    );
  }
}
