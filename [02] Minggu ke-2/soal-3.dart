import 'dart:io';

void main() {
  // Meminta input dari pengguna
  stdout.write("Bilangan 1: ");
  int num1 = int.parse(stdin.readLineSync()!);

  stdout.write("Bilangan 2: ");
  int num2 = int.parse(stdin.readLineSync()!);

  // Menghitung KPK
  int kpk = calculateLCM(num1, num2);

  // Menampilkan hasil
  print("KPK $num1 dan $num2 = $kpk");
}

// Fungsi untuk menghitung KPK
int calculateLCM(int a, int b) {
  return (a * b) ~/ calculateGCD(a, b);
}

// Fungsi untuk menghitung FPB menggunakan algoritma Euclidean
int calculateGCD(int a, int b) {
  while (b != 0) {
    int temp = b;
    b = a % b;
    a = temp;
  }
  return a;
}
