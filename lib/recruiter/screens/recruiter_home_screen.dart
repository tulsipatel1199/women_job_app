import 'package:flutter/material.dart';

class RecruiterHomeScreen extends StatelessWidget {
  const RecruiterHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            items: [BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: "My Profile")],
          ),
        floatingActionButton: FloatingActionButton(onPressed: (){},child: Icon(Icons.add),),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              //mainAxisSize: MainAxisSize.min,
              children:  [
                TextField(
                  decoration: InputDecoration(hintText: "Search here",
                    border: OutlineInputBorder( ),

                    prefixIcon: Icon(Icons.search),

                  ),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, i){
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: InkWell(
                            onTap: (){
                             // Get.to(()=>CandidateJobDetailsScreen());
                            },
                            child: Container(
                              decoration: BoxDecoration(borderRadius : BorderRadius.circular(8),color: Colors.cyan),
                              child:
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                                child: Column(
                                  // mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("$i Company Name",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                    Text("Salary: 30k"),
                                    Text("Tenure: 2 year "),
                                    Text("Job description: the job is about doing......"),

                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ),




              ],
            ),
          )
      ),
    );
  }
}
