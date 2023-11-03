import 'package:get/get.dart';

class HomeController extends GetxController {
  
  //obs (observasi) digunakan untuk melihat setiap perubahan yang ada
  //tipe data dari obs harus berupa var atau menggunakan reactive state tipe data
  // var dataPantau = 1.obs;

  //contoh inisialisasi data simple state dimana tidak diperlukannya setiap perubahan di observasi
  //dan dapat dilakukan if statement untuk menentukan kapan akan di lihat
  int dataPantau = 1;

  // void tambahData() {
  //   dataPantau+=1;
  // }


  //penggunakan if statement untuk menampilkan data apabila telah diinputkan sebanyak 5x
  void tambahData() {
    dataPantau+=1;
    if (dataPantau % 5 == 0) {
      update();
    }
  }

  void refreshTampilan() {
    update();
  }


}