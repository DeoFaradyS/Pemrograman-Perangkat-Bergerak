import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  File? _imageFile; // Menyimpan file gambar yang dipilih
  File? _videoFile; // Menyimpan file video yang dipilih

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minggu Ke-8'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildImageFromAsset(),
            _buildImageFromFile(),
            _buildButton('Ambil image dari galeri', pickImageFromGallery),
            _buildButton('Ambil image dari camera', pickImageFromCamera),
            _buildButton('Ambil video dari galeri', pickVideoFromGallery),
            _buildButton('Ambil video dari camera', pickVideoFromCamera),
          ],
        ),
      ),
    );
  }

// Menampilkan gambar dari aset lokal
  Widget _buildImageFromAsset() {
    return Image.asset('assets/1.jpg');
  }

// Menampilkan gambar yang dipilih dari file
  Widget _buildImageFromFile() {
    return _imageFile != null
        ? Image.file(_imageFile!)
        : const Text('Tidak ada gambar yang dipilih');
  }

// Membuat tombol dengan teks dan fungsi yang dapat disesuaikan
  Widget _buildButton(String text, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }

 // Memilih gambar dari galeri
  Future<void> pickImageFromGallery() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    _updateImageFile(pickedFile);
  }

// Mengambil gambar dari kamera
  Future<void> pickImageFromCamera() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
    _updateImageFile(pickedFile);
  }

 // Memilih video dari galeri
  Future<void> pickVideoFromGallery() async {
    final pickedFile = await ImagePicker().pickVideo(source: ImageSource.gallery);
    _updateVideoFile(pickedFile);
  }

// Merekam video dari kamera
  Future<void> pickVideoFromCamera() async {
    final pickedFile = await ImagePicker().pickVideo(source: ImageSource.camera);
    _updateVideoFile(pickedFile);
  }

// Memperbarui file gambar yang dipilih
  void _updateImageFile(XFile? pickedFile) {
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

// Memperbarui file video yang dipilih
  void _updateVideoFile(XFile? pickedFile) {
    if (pickedFile != null) {
      setState(() {
        _videoFile = File(pickedFile.path);
      });
    }
  }
}