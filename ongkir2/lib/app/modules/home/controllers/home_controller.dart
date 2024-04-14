import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

import 'package:http/http.dart' as http;
import 'package:ongkir2/app/data/models/ongkir_model.dart';

class HomeController extends GetxController {
  TextEditingController berat = TextEditingController();

  List<Ongkir> ongkoskirim = [];
  RxBool isLoading = false.obs;

  RxString provAsalId = "0".obs;
  RxString cityAsalId = "0".obs; 
  RxString provTujuanId = "0".obs;
  RxString cityTujuanId = "0".obs;

  RxString codeKurir = "".obs;

  void cekOngkir() async{
    if (provAsalId != "0" && provTujuanId != "0" && cityAsalId != "0" && cityTujuanId != "0" && codeKurir != "0" && berat != "") {
      try {
        isLoading.value = true;
        var response = await http.post(
          Uri.parse("https://api.rajaongkir.com/starter/cost"),
          headers: {
            "key" : "8e8331a7b1efbd90ec885b3cb860e337",
            "content-type": "application/x-www-form-urlencoded"
          },
          body: {
            "origin": cityAsalId.value,
            "destination": cityTujuanId.value,
            "weight": berat.text,
            "courier": codeKurir.value,
          }
        );
        isLoading.value = false;
        List ongkir = jsonDecode(response.body)['rajaongkir']['results'][0]['costs'] as List;
        ongkoskirim = Ongkir.fromJsonList(ongkir);
        
        Get.defaultDialog(
          title: "Ongkos Kirim",
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: ongkoskirim
              .map(
                (e) => ListTile(
                  title: Text("${e.service!.toUpperCase()}"),
                  subtitle: Text("Rp. ${e.cost![0].value}"),
                ),
                ).toList(),
          )
        );
      } catch (e) {
        print(e);
        Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Tidak dapat mengecek data ongkir"
      );
      }
    }else{
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Data belum lengkap"
      );
    }
  }
}
