import 'dart:convert';

import 'package:flutter/material.dart';
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

  late String id;
  late String email;
  late String name;

  @override
  void initState() {
    // TODO: implement initState
    id = "";
    email = "";
    name = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HTPP GET"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "ID = ${id}",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              "EMAIL = ${email}",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              "NAMA = ${name}",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(height: 15,),
            ElevatedButton(
              onPressed: () async {
                var response = await http.get(Uri.parse("https://reqres.in/api/users/2"));
                if (response.statusCode == 200) {
                  //data berhasil diambil
                  print("berhasil get data");
                  var data = json.decode(response.body);
                  setState(() {
                    id = data["data"]["id"].toString();
                    email = data["data"]["email"].toString();
                    name = "${data["data"]["first_name"]} ${data["data"]["last_name"]}";
                    
                  });
                }else {
                  print("error ${response.statusCode}");
                }
              
              }, 
              child: Text("GET DATA"))
          ],
        ),
      ),
    );
  }
}