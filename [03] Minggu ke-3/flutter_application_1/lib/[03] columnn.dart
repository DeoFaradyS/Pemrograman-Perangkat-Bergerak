import 'package:flutter/material.dart';

class Columnn extends StatelessWidget {
  const Columnn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          Container(
            width: 50,
            height: 50,
            color: Colors.red,
          ),
          Container(
            width: 50,
            height: 50,
            color: Colors.green,
          ),
          Container(
            width: 50,
            height: 50,
            color: Colors.blue,
          ),
        ],
      )),
    );
  }
}
