
void main(List<String> args) {
  penjumlahan(1, 2, 3);
  int hasilPengurangan = pengurangan(2, 3);
  print(hasilPengurangan);
  
  
}

//void digunakan untuk sebuah method yang tidak menghasilkan sesuatu
void penjumlahan (int angka1, int angka2, int angka3){
  print(angka1 + angka2 + angka3);
}

//static fungtion dimana dapat mereturn sebuah nilai yang di proses
int pengurangan (int angka1, int angka2) {
  int hasil = angka1 - angka2;

  return hasil;
}