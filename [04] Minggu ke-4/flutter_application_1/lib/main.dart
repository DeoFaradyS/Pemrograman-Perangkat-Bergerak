import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override

  /// Builds the home screen of the app.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        /// Tinggi toolbar
        toolbarHeight: 32,

        /// Warna latar belakang AppBar
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SafeArea(
        child: Column(
          children: [
            /// Header bagian atas dengan greeting dan avatar

            Container(
              padding: const EdgeInsets.all(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// Kolom untuk teks
                  // Kolom untuk teks
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Nama dan NIM
                      Text(
                        'Welcome,',
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '1201220447 - Deo',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),

                  /// Kontainer untuk avatar (lingkaran)
                  // Kontainer untuk avatar (lingkaran)
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      /// Warna avatar
                      color: Colors.blue,

                      /// Membuat bentuk bulat
                      borderRadius: BorderRadius.circular(99),
                    ),
                  )
                ],
              ),
            ),

            /// Kotak merah di tengah layar
            // Kotak merah di tengah layar
            Center(
              child: Container(
                height: 240,
                width: 240,
                decoration: BoxDecoration(
                  /// Warna kotak
                  color: Colors.red,

                  /// Sudut kotak melengkung
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20), // Ruang kosong di bawah kotak
          ],
        ),
      ),
    );
  }
}
