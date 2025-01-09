import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ini Halaman Pertama',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Menyusun kolom di tengah
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/secondscreen');
              },
              child: const Text('Halaman 2'), // Teks tombol sudah baik
            ),
            TextButton(
              onPressed: () {
                // Tambahkan navigasi atau fungsi lain di sini
                Navigator.pushNamed(context,
                    '/anotherScreen'); // Misalnya, navigasi ke layar lain
              },
              child: const Text(
                  'Go to Another Screen'), // Menambahkan teks pada tombol kedua
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/argument');
                },
                child: const Text('Go to Argument Screen')),
            TextButton(
                onPressed: () {
                  _returnData();
                },
                child: const Text('Go to return data Screen'))
          ],
        ),
      ),
    );
  }

  Future<void> _returnData() async {
    final result = await Navigator.pushNamed(context, '/return-data');

    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(result.toString())),
    );
  }
}
