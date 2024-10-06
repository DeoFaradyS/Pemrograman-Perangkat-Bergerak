import 'dart:io';

void main() {
  // Membuat list 2 dimensi
  List<List<int>> list2D = createList2D();

  // Menampilkan isi list
  displayList(list2D);

  // Meminta input dari pengguna untuk mencari bilangan
  int target = getUserInput();

  // Mencari nilai target dalam list 2 dimensi dan menampilkan hasil
  List<String> positions = findInList(list2D, target);
  displayResults(positions, target);
}

// Fungsi untuk membuat list 2 dimensi
List<List<int>> createList2D() {
  return [
    // Baris 1: 3 bilangan kelipatan 5, mulai dari 5
    [for (int i = 1; i <= 3; i++) i * 5],
    
    // Baris 2: 4 bilangan genap, mulai dari 2
    [for (int i = 1; i <= 4; i++) i * 2],
    
    // Baris 3: 5 bilangan kuadrat dari bilangan asli, mulai dari 1
    [for (int i = 1; i <= 5; i++) i * i],
    
    // Baris 4: 6 bilangan asli berurutan, mulai dari 3
    [for (int i = 3; i < 3 + 6; i++) i]
  ];
}

// Fungsi untuk menampilkan isi list
void displayList(List<List<int>> list2D) {
  print("Isi List:");
  for (List<int> row in list2D) {
    print(row.join(" "));
  }
}

// Fungsi untuk meminta input dari pengguna
int getUserInput() {
  stdout.write("\nBilangan yang dicari: ");
  return int.parse(stdin.readLineSync()!);
}

// Fungsi untuk mencari nilai dalam list 2 dimensi
List<String> findInList(List<List<int>> list2D, int target) {
  List<String> result = [];

  for (int i = 0; i < list2D.length; i++) {
    for (int j = 0; j < list2D[i].length; j++) {
      if (list2D[i][j] == target) {
        // Menyimpan posisi baris dan kolom (baris dan kolom dimulai dari 1)
        result.add("baris ${i + 1} kolom ${j + 1}");
      }
    }
  }

  return result;
}

// Fungsi untuk menampilkan hasil pencarian
void displayResults(List<String> positions, int target) {
  if (positions.isEmpty) {
    print("\nBilangan $target tidak ditemukan dalam list.");
  } else {
    print("\n$target berada di:");
    for (String pos in positions) {
      print(pos);
    }
  }
}
