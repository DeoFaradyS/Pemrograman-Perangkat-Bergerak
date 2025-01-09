import 'package:button_screen/argument.dart';
import 'package:button_screen/new.dart';
import 'package:button_screen/returndata.dart';
import 'package:button_screen/secondscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes:{
        '/' : (context) => const FirstScreen(),
        '/secondscreen' : (context) => const SecondScreen(),
        '/argument' :  (context) => const ArgumentScreen(message: 'cihuyy'),
        '/return-data'  : (context) => const ReturnData(),


      } 
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alert Dialog Title'),
          content: const Text('This is the content of the alert dialog.'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Deo Farady Santoso',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
        ),
        backgroundColor: const Color(0xFFFFFFFF),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_vert,color: Colors.white,),
            itemBuilder: (context) {
              return [
                const PopupMenuItem(
                  child: Text('Log Out', style: TextStyle(color: Colors.red),),
                )
              ];
            },
          )
        ],
      ),
      body: Center(
        child: _selectedIndex == 0
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _showDialog,
                    child: const Text('Show Alert Dialog'),
                  ),
                ],
              )
            : _selectedIndex == 1
                ? const Text('Menu 2 Selected')
                : const Text('Menu 3 Selected'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Menu 2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Menu 3',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
