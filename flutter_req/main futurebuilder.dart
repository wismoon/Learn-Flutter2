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

  List<Map <String, dynamic>> allUsers = [];

  Future getAllUsers() async{
    try {
      var response = await http.get(Uri.parse("https://reqres.in/api/users"));
      List data = (json.decode(response.body) as Map <String, dynamic>)['data'];

      data.forEach((element) {
        allUsers.add(element);
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
                backgroundImage: NetworkImage(allUsers[index]['avatar']),
              ),
              title: Text("${allUsers[index]['first_name']} ${allUsers[index]['last_name']}"),
              subtitle: Text("${allUsers[index]['email']}"),
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