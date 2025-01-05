import 'package:flutter/material.dart';
import 'package:belajar_api/Screen/todo_api_crud.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TodoApiCrud(),
    );
  }
}