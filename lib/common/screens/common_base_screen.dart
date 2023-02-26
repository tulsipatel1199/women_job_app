import 'package:flutter/material.dart';

class CommonBaseScreen extends StatelessWidget {
  const CommonBaseScreen({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric( horizontal: 40),
          child: child,
        ),
      ),

    );
  }
}
