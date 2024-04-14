import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:dio/dio.dart';

import '../controllers/home_controller.dart';
import 'package:ongkir2/app/data/models/province_model.dart';
import 'package:ongkir2/app/data/models/city_model.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ongkir'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          DropdownSearch<Province>(
            popupProps: PopupProps.menu(
              showSearchBox: true,
              itemBuilder: (context, item, isSelected) => ListTile(
                title: Text("${item.province}"),
              ),
            ),
            dropdownDecoratorProps: DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                    labelText: "Provinsi Asal",
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 15))),
            asyncItems: (text) async {
              var response = await Dio().get(
                  "https://api.rajaongkir.com/starter/province",
                  queryParameters: {"key": "8e8331a7b1efbd90ec885b3cb860e337"});
              return Province.fromJsonList(
                  response.data["rajaongkir"]["results"]);
            },
            onChanged: (value) =>
                controller.provAsalId.value = value?.provinceId ?? "0",
          ),
          SizedBox(
            height: 20,
          ),
          DropdownSearch<City>(
            popupProps: PopupProps.menu(
              showSearchBox: true,
              itemBuilder: (context, item, isSelected) => ListTile(
                title: Text("${item.type} ${item.cityName}"),
              ),
            ),
            dropdownDecoratorProps: DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                    labelText: "Kota/Kabupaten Asal",
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 15))),
            asyncItems: (text) async {
              var response = await Dio().get(
                  "https://api.rajaongkir.com/starter/city?province=${controller.provAsalId}",
                  queryParameters: {"key": "8e8331a7b1efbd90ec885b3cb860e337"});
              return City.fromJsonList(response.data["rajaongkir"]["results"]);
            },
            onChanged: (value) =>
                controller.cityAsalId.value = value?.cityId ?? "0",
          ),
          SizedBox(
            height: 20,
          ),
          DropdownSearch<Province>(
            popupProps: PopupProps.menu(
              showSearchBox: true,
              itemBuilder: (context, item, isSelected) => ListTile(
                title: Text("${item.province}"),
              ),
            ),
            dropdownDecoratorProps: DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                    labelText: "Provinsi Tujuan",
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 15))),
            asyncItems: (text) async {
              var response = await Dio().get(
                  "https://api.rajaongkir.com/starter/province",
                  queryParameters: {"key": "8e8331a7b1efbd90ec885b3cb860e337"});
              return Province.fromJsonList(
                  response.data["rajaongkir"]["results"]);
            },
            onChanged: (value) =>
                controller.provTujuanId.value = value?.provinceId ?? "0",
          ),
          SizedBox(
            height: 20,
          ),
          DropdownSearch<City>(
            popupProps: PopupProps.menu(
              showSearchBox: true,
              itemBuilder: (context, item, isSelected) => ListTile(
                title: Text("${item.type} ${item.cityName}"),
              ),
            ),
            dropdownDecoratorProps: DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                    labelText: "Kota/Kabupaten Tujuan",
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 15))),
            asyncItems: (text) async {
              var response = await Dio().get(
                  "https://api.rajaongkir.com/starter/city?province=${controller.provTujuanId}",
                  queryParameters: {"key": "8e8331a7b1efbd90ec885b3cb860e337"});
              return City.fromJsonList(response.data["rajaongkir"]["results"]);
            },
            onChanged: (value) =>
                controller.cityTujuanId.value = value?.cityId ?? "0",
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: controller.berat,
            autocorrect: false,
            decoration: InputDecoration(
                labelText: "Berat (gram)",
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 15)),
          ),
          SizedBox(
            height: 20,
          ),
          DropdownSearch<Map<String, dynamic>>(
            items: [
              {"code": "jne", "name": "JNE"},
              {"code": "pos", "name": "POS Indonesia"},
              {"code": "tiki", "name": "TIKI"}
            ],
            popupProps: PopupProps.menu(
              showSearchBox: true,
              itemBuilder: (context, item, isSelected) => ListTile(
                title: Text("${item['name']}"),
              ),
            ),
            dropdownDecoratorProps: DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                    labelText: "Pilih kurir",
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 15))),
            dropdownBuilder: (context, selectedItem) =>
                Text("${selectedItem?['name'] ?? "pilih kurir"}"),
            onChanged: (value) =>
                controller.codeKurir.value = value?['code'] ?? "",
          ),
          SizedBox(
            height: 20,
          ),
          Obx(() => ElevatedButton(
              onPressed: () {
                if (controller.isLoading.isFalse) {
                  controller.cekOngkir();
                }
              },
              child: Text(
                  controller.isLoading.isFalse ? "Cek Ongkir" : "Loading")))
        ],
      ),
    );
  }
}
