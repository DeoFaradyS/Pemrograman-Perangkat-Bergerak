import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          // Menggunakan Column untuk menampung dua Row
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Deo Farady Santoso - 1201220447',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                CircleAvatar(
                  radius: 30,
                  backgroundImage:
                      NetworkImage('https://example.com/profile.jpg'),
                ),
              ],
            ),
            SizedBox(height: 20), // Jarak antara dua Row
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Menjaga agar lingkaran di tengah
              children: [
                Container(
                  width: 200, // Diameter lingkaran (2 * radius)
                  height: 200, // Diameter lingkaran (2 * radius)
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        10), // Membulatkan sudut dengan radius 24
                    color: Colors.blue, // Warna lingkaran
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
