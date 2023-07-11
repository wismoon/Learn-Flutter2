import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_req/main.dart';
import 'package:http/http.dart' as http;

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  String data = "belom ada data";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HTTP DELETE"),
        actions: [
          IconButton(onPressed: () async {
            var response = await http.get(Uri.parse("https://reqres.in/api/users/2"));
            Map<String, dynamic> mybody = json.decode(response.body);
            setState(() {
              data = "Nama = ${mybody["data"]["first_name"]}${mybody["data"]["last_name"]}";
            });
          }, 
          icon: Icon(Icons.get_app))
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Text(data),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: () async {
            var response = await http.delete(Uri.parse("https://reqres.in/api/users/2"));
            if (response.statusCode == 204) {
            setState(() {
              data = "berhasil menghapus";
            });
            }
           
          }, child: Text("DELETE"))
        ],
      ),
    );
  }
}