import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deo'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // elevated button
            ElevatedButton(
              onPressed: () {},
              child: const Text('Kirim'),
            ),

            // outlined button
            OutlinedButton(
              onPressed: () {},
              child: const Text('Batal'),
            ),

            // floating action button
            FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.add),
            ),

            // dropdown button
            DropdownButton<String>(
              items: <String>['Satu', 'Dua', 'Tiga']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {},
            ),

            // icon button
            IconButton(
              icon: const Icon(Icons.favorite),
              onPressed: () {},
            ),

            // popup menu
            PopupMenuButton<String>(
              onSelected: (String value) {
                // Aksi saat salah satu opsi dipilih
              },
              itemBuilder: (BuildContext context) {
                return {'Opsi 1', 'Opsi 2', 'Opsi 3'}.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            ),

            // snackbar
            ElevatedButton(
              onPressed: () {
                // Menampilkan SnackBar saat tombol ditekan
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('Ini adalah SnackBar!'),
                    action: SnackBarAction(
                      label: 'TUTUP',
                      onPressed: () {
                        // Aksi saat tombol TUTUP ditekan
                      },
                    ),
                    duration: const Duration(seconds: 3), // Durasi SnackBar
                  ),
                );
              },
              child: const Text('Tampilkan SnackBar'),
            ),

            // simple dialog
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return SimpleDialog(
                      title: const Text('Simple Dialog'),
                      children: <Widget>[
                        SimpleDialogOption(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Opsi 1'),
                        ),
                        SimpleDialogOption(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Opsi 2'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('Tampilkan Simple Dialog'),
            ),

            // alert dialog
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Alert Dialog'),
                      content: const Text('Ini adalah Alert Dialog.'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Tutup'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('Tampilkan Alert Dialog'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: 0, // Indeks yang aktif
        selectedItemColor: Colors.blue,
        onTap: (int index) {
          // Aksi saat item navigasi ditekan
        },
      ),
    );
  }
}
