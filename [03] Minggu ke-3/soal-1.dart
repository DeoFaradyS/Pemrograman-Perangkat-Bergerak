import 'dart:math';

void main() {
  int a = 3, b = 2;

  // Membuat dan menampilkan matriks
  List<List<int>> matrix = createMatrix(a, b);

  // Menampilkan matriks
  print('Matriks $a x $b:');
  printMatrix(matrix);

  // Menampilkan hasil transpose
  print('Hasil transpose:');
  printMatrix(transpose(matrix));
}

// Fungsi untuk membuat matriks
List<List<int>> createMatrix(int a, int b) =>
    List.generate(a, (_) => List.generate(b, (_) => Random().nextInt(10)));

void printMatrix(List<List<int>> matrix) {
  matrix.forEach((row) => print(row.join(' ')));
}

List<List<int>> transpose(List<List<int>> matrix) => List.generate(
    matrix[0].length, (i) => List.generate(matrix.length, (j) => matrix[j][i]));
