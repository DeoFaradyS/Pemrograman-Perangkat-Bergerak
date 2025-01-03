import 'package:flutter/material.dart';

/// Kelas yang menyimpan semua palet warna aplikasi.
class AppColors {
  // Warna Solid
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color green = Color(0xFF198F51);
  static const Color red = Color(0xFF8F1919);
  static const Color blue = Color(0xFF19628F);

  // Warna Skala Abu-abu
  static const Color gray100 = Color(0xFFF5F5F5);
  static const Color gray500 = Color(0xFFA3A3A3);
  static const Color gray700 = Color(0xFF666666);

  // Warna Latar Belakang
  static const Color primaryBackground = gray100;
  static const Color secondaryBackground = white;

  // Warna Teks
  static const Color primaryText = gray700;
  static const Color secondaryText = gray500;

  // Warna Tombol
  static const Color buttonPrimary = green;
  static const Color buttonDanger = red;
}

class AppTypography {
  static const String fontFamily = 'Poppins';
  static const double fontSize = 16.0;
  static const FontWeight fontWeight = FontWeight.bold;
}
