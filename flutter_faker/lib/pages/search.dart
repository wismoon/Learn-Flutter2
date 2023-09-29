import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:http/http.dart' as http;

class SearchDown extends StatelessWidget {
  const SearchDown({super.key});

  final String apiKey = "bdbfd57c1f28b9596de94508e3d75ee383dc6bc78fe51f6ad7bbde3080a8621b";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search dengan API"),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          DropdownSearch<String>(
            onChanged: (value) => print(value),
            enabled: true,
            asyncItems: (text) async {
              var response = await http.get(Uri.parse("https://api.binderbyte.com/wilayah/provinsi?api_key=$apiKey"));
              if (response.statusCode != 200) {
                return [];
              }
              List allProvince = (json.decode(response.body) as Map<String ,dynamic>) ['value'];
              List<String> allProvinceName = [];

              allProvince.forEach((element) {
                allProvinceName.add(element["name"]);
              });

              return allProvinceName;
            },
          )
        ],
      ),
    );
  }
}