
void main(List<String> args) {
  //data const (konstanta) wajib memiliki value atau nilai untuk inisialisasi awal
  const String nama = 'wisnu';
  //sedangkan final bisa tidak memiliki nilai awal  saat inisialisasi
  final int age;
  //memberi nilai pada data age final
  age = 24;
  double height = 165.4;
  List <String> hobby = ["main game", "makan enak", "ngoding"];
  Map keluarga = {"ayah": "nuh", "ibu": "win", "adek": "apin"};

  print(nama.endsWith('u'));
  print(age);
  print(height);
  print("hobby = $hobby");
  print("memiliki ayah bernama: ${keluarga["ayah"]}");

}