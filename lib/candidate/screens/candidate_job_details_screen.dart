
import 'package:flutter/material.dart';

class CandidateJobDetailsScreen extends StatelessWidget {
  const CandidateJobDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ) ,

      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Company Name",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
            Text("Salary: 30k"),
            Text("Tenure: 2 year "),
            Text("Job description: the job is about doing......"),

          ],
        ),
      ),

    );
  }
}

