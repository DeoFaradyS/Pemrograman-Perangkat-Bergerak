import 'package:flutter/material.dart';
import 'package:flutter_application_1/%5B03%5D%20columnn.dart';
import 'package:flutter_application_1/%5B01%5D%20container.dart';
import 'package:flutter_application_1/%5B04%5D%20ListVieww.dart';
import 'package:flutter_application_1/%5B05%5D%20GridVieww.dart';
import 'package:flutter_application_1/%5B06%5D%20Stack.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: stack(),
      debugShowCheckedModeBanner: false,
    );
  }
}
