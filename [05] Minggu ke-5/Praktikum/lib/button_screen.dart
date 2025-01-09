import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  String _selectedItem = 'item 1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
              child: const Text('Button', style: TextStyle(fontSize: 16)),
            ),
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 0, 179, 255)),
                child: const Text('elevated button')),
            OutlinedButton(onPressed: () {}, child: const Text('outline button')),
            IconButton(onPressed: () {}, icon: const Icon(Icons.thumb_up)),
            DropdownButton<String>(
                value: _selectedItem,
                items: const [
                  DropdownMenuItem(value: 'item 1', child: Text('item 1')),
                  DropdownMenuItem(value: 'item 2', child: Text('item 2')),
                  DropdownMenuItem(value: 'item 3', child: Text('item 3')),
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedItem = value!;
                  });
                }),
          ],
        ),
      ),
    );
  }
}
