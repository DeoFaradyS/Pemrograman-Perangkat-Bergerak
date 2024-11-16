import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  File? imageFile;
  File? videoFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minggu Ke-8'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ambil image dari asset/lokal
            Image.asset('assets/1.jpg'),

            // menampilkan image dari button di bawah ini
            imageFile != null
                ? Image.file(imageFile!) // tampilkan gambar jika ada
                : const Text(
                    'Tidak ada gambar yang dipilih'), // pesan jika tidak ada gambar

            // ambil image dari galeri
            ElevatedButton(
              onPressed: pickImageFromGallery,
              child: const Text('Ambil image dari galeri'),
            ),

            // ambil image dari camera
            ElevatedButton(
              onPressed: pickImageFromCamera,
              child: const Text('Ambil image dari camera'),
            ),

            // ambil video dari galeri
            ElevatedButton(
              onPressed: pickVideoFromGallery,
              child: const Text('Ambil video dari galeri'),
            ),

            // ambil video dari camera
            ElevatedButton(
              onPressed: pickVideoFromCamera,
              child: const Text('Ambil video dari camera'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> pickImageFromGallery() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  Future<void> pickImageFromCamera() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  Future<void> pickVideoFromGallery() async {
    final pickedFile =
        await ImagePicker().pickVideo(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        videoFile = File(pickedFile.path);
      });
    }
  }

  Future<void> pickVideoFromCamera() async {
    final pickedFile =
        await ImagePicker().pickVideo(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        videoFile = File(pickedFile.path);
      });
    }
  }
}
