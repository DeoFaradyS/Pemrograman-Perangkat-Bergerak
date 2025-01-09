import 'package:flutter/material.dart';
import 'login_register_page.dart';
import 'user_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login & Register App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginRegisterPage(),
      routes: {
        '/userList': (context) => UserListPage(),
      },
    );
  }
}
