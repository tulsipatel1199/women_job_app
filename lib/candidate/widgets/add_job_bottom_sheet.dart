import 'package:flutter/material.dart';

import '../controllers/recruiter_controller.dart';
import 'custom_text_field.dart';

class AddJobBottomSheet extends StatelessWidget {
  const AddJobBottomSheet({
    super.key,
    required this.recruiterController,
  });

  final RecruiterController recruiterController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration:const BoxDecoration(color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(16)) ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
        child: ListView(
          children: [
            CustomTextField(controller:recruiterController.roleCtr.value , title: 'Job role',),
            CustomTextField(controller:recruiterController.companyNameCtr.value , title: 'Company',),
            CustomTextField(controller:recruiterController.salaryCtr.value , title: 'Salary (LPA)',),
            CustomTextField(controller:recruiterController.tenureCtr.value , title: 'Tenure',),
            CustomTextField(controller:recruiterController.descriptionCtr.value , title: 'Description',minLines: 5,),

          ],
        ),
      ),
    );
  }
}
