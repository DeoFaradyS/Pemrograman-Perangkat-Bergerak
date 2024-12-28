import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:async';
import 'splash_screen_1.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // Durasi delay dalam detik
  static const int _splashDelay = 3;

  @override
  void initState() {
    super.initState();
    _navigateToNextPage();
  }

  // Fungsi untuk navigasi ke halaman berikutnya setelah delay
  void _navigateToNextPage() {
    Future.delayed(const Duration(seconds: _splashDelay), () {
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(
            builder: (context) =>
                const SplashScreen1()), // Navigasi ke halaman baru
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(
          "assets/icons/Logo.svg",
          height: 64,
        ),
      ),
    );
  }
}
