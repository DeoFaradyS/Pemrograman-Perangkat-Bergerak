import 'package:flutter/material.dart';

class Dialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () => showSimpleDialog(context),
            child: Text('Tampilkan Simple Dialog'),
          ),
          SizedBox(height: 20), // Jarak antar tombol
          ElevatedButton(
            onPressed: () => showAlertDialog(context),
            child: Text('Tampilkan Alert Dialog'),
          ),
        ],
      ),
    );
  }
}

// Fungsi untuk menampilkan Simple Dialog
void showSimpleDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return SimpleDialog(
        title: Text('Pilih Opsi'),
        children: <Widget>[
          SimpleDialogOption(
            onPressed: () {
              Navigator.pop(context, 'Opsi 1');
            },
            child: Text('Opsi 1'),
          ),
          SimpleDialogOption(
            onPressed: () {
              Navigator.pop(context, 'Opsi 2');
            },
            child: Text('Opsi 2'),
          ),
        ],
      );
    },
  );
}

// Fungsi untuk menampilkan Alert Dialog
void showAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Konfirmasi'),
        content: Text('Apakah Anda yakin ingin melanjutkan?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Menutup dialog
            },
            child: Text('Batal'),
          ),
          TextButton(
            onPressed: () {
              // Aksi saat pengguna mengonfirmasi
              Navigator.pop(context); // Menutup dialog
              // Tambahkan aksi lain di sini jika perlu
            },
            child: Text('OK'),
          ),
        ],
      );
    },
  );
}
