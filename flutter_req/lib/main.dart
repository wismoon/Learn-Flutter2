import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_req/Models/Users.dart';
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

  //membuat list dengan isi model yang telah dibuat 
  List<UserModel> allUsers = [];


  //future fungsi dimana untuk mendapatkan data dan mengulang per data yang kita inginkan
  Future getAllUsers() async{
    //membuat try catch untuk menampung error 
    try {
      var response = await http.get(Uri.parse("https://reqres.in/api/users?=page1"));
      // mengisi list data dengan hasil json dari respon
      List data = (json.decode(response.body) as Map <String, dynamic>)['data'];

      //for each data yang telah di decode sebanyak semua data
      data.forEach((element) {
        allUsers.add(UserModel.fromJson(element));
        
      });
      
      print(allUsers);
    } catch (e) {
      //print jika terjadi error
      print("error bang ${e}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("future builder"),
      ),

      //menggunakan future builder agar bisa menggunakan future fungsi
      body: FutureBuilder(
        future: getAllUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: Text("Loading Data"),);
          } else {
          return ListView.builder(
            itemCount: allUsers.length,
            itemBuilder: (context, index) => ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.green[300],
                backgroundImage: NetworkImage(allUsers[index].avatar),
              ),
              title: Text("${allUsers[index].firstName} ${allUsers[index].lastName}"),
              subtitle: Text("${allUsers[index].email}"),
            ),
          );}
        }
      ),
    );
  }
}

// body: Center (
//         child: ElevatedButton(
//           onPressed: () async {
//             var response = await http.get(Uri.parse("https://reqres.in/api/users?page=2"));
//             List data = (json.decode(response.body) as Map <String, dynamic>)['data'];
//             data.forEach((element) {
//               Map<String, dynamic> users = element;
//               print(users);
//             });
//           }, 
//           child: Text("Click"))),