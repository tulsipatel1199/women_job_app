import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlertDialogWidget extends StatelessWidget {
  const AlertDialogWidget({Key? key,required this.warningMessage, required this.buttonText,this.buttonColor=Colors.redAccent, required this.onPressed}) : super(key: key);

  final String warningMessage;
  final String buttonText;
  final Color buttonColor;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(title: Text(warningMessage),
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      actions: [
        ElevatedButton(onPressed: (){
          Get.back();
        },
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.transparent),
              side: MaterialStatePropertyAll(BorderSide(
                  width: 1,
                  color: Colors.black
              ))
          ), child: const Text("Cancel"),
        ),
        ElevatedButton(onPressed: onPressed,
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(buttonColor),
              side: const MaterialStatePropertyAll(BorderSide(
                  width: 1,
                  color: Colors.black
              ))
          ),
          child: Text(buttonText),
        ),
      ],

    );
  }
}
