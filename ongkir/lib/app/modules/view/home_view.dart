import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

import 'package:ongkir/app/modules/controllers/home_controller.dart';
import 'package:ongkir/app/data/models/province_model.dart';
import 'package:ongkir/app/data/models/city_model.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ongkir"),
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
              contentPadding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 15
              ))
            ),
            asyncItems: (text) async{
              var response = await Dio().get(
                "https://api.rajaongkir.com/starter/province",
                queryParameters: {
                  "key" : "8e8331a7b1efbd90ec885b3cb860e337"
                });
                return Province.fromJsonList(response.data["rajaongkir"]["results"]);
            },
            onChanged: (value) => controller.provAsalId.value = value?.provinceId ?? "0",
          ),
          SizedBox(height: 20,),
          DropdownSearch<City>( 
            popupProps: PopupProps.menu(
              showSearchBox: true,
              itemBuilder: (context, item, isSelected) => ListTile(
                title: Text("${item.cityName}"),
              ),
            ),
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
              labelText: "Kota/Kabupaten Asal",
              contentPadding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 15
              ))
            ),
            asyncItems: (text) async{
              var response = await Dio().get(
                "https://api.rajaongkir.com/starter/city?province=${controller.provAsalId}",
                queryParameters: {
                  "key" : "8e8331a7b1efbd90ec885b3cb860e337"
                });
                return City.fromJsonList(response.data["rajaongkir"]["results"]);
            },
            onChanged: (value) => print(value?.toJson()),
          )
        ],
      ),
    );
  }
}
