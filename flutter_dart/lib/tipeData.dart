
void main(List<String> args) {
  String nama = 'wisnu';
  int age = 24;
  double height = 165.4;
  List <String> hobby = ["main game", "makan enak", "ngoding"];
  Map keluarga = {"ayah": "nuh", "ibu": "win", "adek": "apin"};

  print(nama.endsWith('u'));
  print(age);
  print(height);
  print("hobby = $hobby");
  print("memiliki ayah bernama: ${keluarga["ayah"]}");

}