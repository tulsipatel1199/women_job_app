import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/profile_controller.dart';


// ignore: must_be_immutable
class ProfileScreen extends StatelessWidget{
  ProfileScreen({super.key});
  ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),

      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:   [
            const CircleAvatar(backgroundImage: AssetImage('assets/default/maleProfile.png'),radius: 70,),
            const SizedBox(height: 20,),
             Text(profileController.name.value),
             Text(profileController.email.value),
            const SizedBox(height: 20,),
            TextButton(onPressed: (){
              Get.dialog(AlertDialog(title: Text("Are you sure, you want to logout?"),
              actionsAlignment: MainAxisAlignment.spaceEvenly,
              actions: [
                ElevatedButton(onPressed: (){
                  Get.back();
                }, child: const Text("Cancel"),
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.transparent),
                  side: MaterialStatePropertyAll(BorderSide(
                    width: 1,
                    color: Colors.black
                  ))
                ),
                ),
                ElevatedButton(onPressed: (){
                            profileController.logout();
                          },
                    child: const Text("Logout"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.redAccent),
                        side: MaterialStatePropertyAll(BorderSide(
                            width: 1,
                            color: Colors.black
                        ))
                    ),
                ),
              ],

              )


              //     Dialog(
              //   child: Padding(
              //     padding: const EdgeInsets.all(20),
              //     child: Row(
              //       mainAxisSize: MainAxisSize.min,
              //       children: [
              //         const Text("Are you sure, you want to logout?"),
              //         const SizedBox(height: 20,),
              //         ElevatedButton(onPressed: (){
              //           profileController.logout();
              //         }, child: const Text("Logout")),
              //         TextButton(onPressed: (){Get.back();}, child: const Text("Cancel"))
              //       ],
              //     ),
              //   ),
              // )
              );
            }, child: const Text("Log Out") )





          ],
        ),
      ),
    );
  }


}