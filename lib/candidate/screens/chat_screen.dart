import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:women_job_app/candidate/controllers/chat_controller.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({Key? key}) : super(key: key);
  ChatController controller = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Customer Support"),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical:16.0,horizontal: 16.0),
        child: Row(
          children: [
            Expanded(
                flex: 7,
                child: TextField(
                  controller: controller.msgCtr.value,
                )),
            const SizedBox(width: 8),
            Expanded(
              flex: 2,
              child: ElevatedButton(
                child: const Text("Send"),
                onPressed: (){
                  controller.sendMessage();
                },
              ),
            ),
          ],
        ),
      ),
      body: const Padding(padding: EdgeInsets.all(16.0),
      child: MessagesStream()),
    );
  }
}
