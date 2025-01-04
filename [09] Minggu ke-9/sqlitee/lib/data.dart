import 'package:flutter/material.dart';
import 'DataStorageService.dart';
import 'User.dart';

class DataStorageDemo extends StatefulWidget {
  const DataStorageDemo({super.key});

  @override
  State<DataStorageDemo> createState() => _DataStorageDemoState();
}

class _DataStorageDemoState extends State<DataStorageDemo> {
  final DataStorageService _dataStorageService = DataStorageService();
  final String _name = 'Abriel Karisma';
  final String _token = '759ngfdnndkmg59u5u98u584';

  String _savedName = '';
  String _savedToken = '';
  User? _localUser ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Storage Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSharedPreferencesSection(),
            const SizedBox(height: 20),
            _buildSecureStorageSection(),
            const SizedBox(height: 20),
            _buildLocalFileStorageSection(),
            const SizedBox(height: 20),
            _buildSQLiteSection(),
          ],
        ),
      ),
    );
  }

  // Widget untuk SharedPreferences section
  Widget _buildSharedPreferencesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '1. SharedPreferences',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            ElevatedButton(
              onPressed: _saveName,
              child: const Text("Simpan Nama"),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              onPressed: _getName,
              child: const Text("Ambil Nama"),
            ),
          ],
        ),
        Text(
          _savedName.isNotEmpty ? "Nama yang disimpan: $_savedName" : "Nama: No data",
          style: const TextStyle(fontSize: 14),
        ),
      ],
    );
  }

  // Widget untuk FlutterSecureStorage section
  Widget _buildSecureStorageSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '2. FlutterSecureStorage',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            ElevatedButton(
              onPressed: _saveToken,
              child: const Text("Simpan Token"),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              onPressed: _getToken,
              child: const Text("Ambil Token"),
            ),
          ],
        ),
        Text(
          _savedToken.isNotEmpty ? "Token yang disimpan: $_savedToken" : "Token: No data",
          style: const TextStyle(fontSize: 14),
        ),
      ],
    );
  }

  // Widget untuk Local File Storage section
  Widget _buildLocalFileStorageSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '3. Penyimpanan File Lokal',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            ElevatedButton(
              onPressed: _saveLocalUser ,
              child: const Text("Simpan User Lokal"),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              onPressed: _getLocalUser ,
              child: const Text("Ambil User Lokal"),
            ),
          ],
        ),
        Text(
          _localUser  != null
              ? ":User  ${_localUser !.name}, Token: ${_localUser !.token}"
              : ":User  No data",
          style: const TextStyle(fontSize: 14),
        ),
      ],
    );
  }

  // Widget untuk SQLite section
  Widget _buildSQLiteSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '4. SQLite',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        ElevatedButton(
          onPressed: _createTable,
          child: const Text("Buat Tabel"),
        ),
      ],
    );
  }

  // Method untuk menyimpan nama
  Future<void> _saveName() async {
    await _dataStorageService.saveName(_name);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Nama disimpan!')),
    );
  }

  // Method untuk mengambil nama
  Future<void> _getName() async {
    String? name = await _dataStorageService.getName();
    setState(() {
      _savedName = name ?? 'No data';
    });
  }

  // Method untuk menyimpan token
  Future<void> _saveToken() async {
    await _dataStorageService.saveToken(_token);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Token disimpan!')),
    );
  }

  // Method untuk mengambil token
  Future<void> _getToken() async {
    String? tokenValue = await _dataStorageService.getToken();
    setState(() {
      _savedToken = tokenValue ?? 'No data';
    });
  }

  // Method untuk menyimpan user lokal
  Future<void> _saveLocalUser () async {
    User user = User(name: _name, token: _token);
    await _dataStorageService.saveLocalUser (user);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('User  lokal disimpan!')),
    );
  }

  // Method untuk mengambil user lokal
  Future<void> _getLocalUser () async {
    _localUser  = await _dataStorageService.getLocalUser ();
    setState(() {});
  }

  // Method untuk membuat tabel SQLite
  Future<void> _createTable() async {
    await _dataStorageService.createTable();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Tabel dibuat!')),
    );
  }
}