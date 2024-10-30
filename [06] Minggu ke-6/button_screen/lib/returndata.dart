import 'package:flutter/material.dart';

class ReturnData extends StatefulWidget {
  const ReturnData({super.key});

  @override
  State<ReturnData> createState() => _ReturnDataState();
}

class _ReturnDataState extends State<ReturnData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Ini Halaman ReturnData',
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
                    Navigator.pop(context, 'Data Terkirim');
                  },
                  child: const Text('back'))
            ],
          ),
        ));
  }
}
