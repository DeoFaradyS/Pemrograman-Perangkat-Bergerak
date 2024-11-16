import 'package:flutter/material.dart';

class Containerr extends StatelessWidget {
  const Containerr({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.green,
          alignment: Alignment.center,
          child: Text('Flutter Cheatsheet'),
          transform: Matrix4.rotationZ(0.5)),
    );
  }
}
