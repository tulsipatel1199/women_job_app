import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    Key? key,
    required this.title,
    required this.controller,
    this.minLines=1,
  }) : super(key: key);

  TextEditingController controller;
  String title;
  int minLines;
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
            minLines: minLines,
            maxLines: minLines+1,
          ),

        ],
      ),
    );
  }
}
