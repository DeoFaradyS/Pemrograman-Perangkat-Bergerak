import 'package:flutter/material.dart';

class ArgumentScreen extends StatefulWidget {
  const ArgumentScreen({super.key, required this.message});

  final String message;

  @override
  State<ArgumentScreen> createState() => _ArgumentScreenState();
}

class _ArgumentScreenState extends State<ArgumentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Ini Halaman Argument',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('back')),
              Text(widget.message),
            ],
          ),
        ));
  }
}
