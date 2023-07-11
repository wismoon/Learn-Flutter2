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

  TextEditingController nameC = TextEditingController();
  TextEditingController jobC = TextEditingController();

  String hasilresponse = "belom ada data";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HTTP POST"),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          TextField(
            controller: nameC,
            autocorrect: false,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: "Name"),
          ),
          SizedBox(height: 20),
          TextField(
            controller: jobC,
            autocorrect: false,
            keyboardType: TextInputType.text,
            decoration:
                InputDecoration(border: OutlineInputBorder(), labelText: "Job"),
          ),
          SizedBox(height: 20),
          ElevatedButton(
              onPressed: () async {
                var response = await http.post(Uri.parse("https://reqres.in/api/users"),
                    body: {"name": nameC.text, "job": jobC.text});

                    Map <String, dynamic> data = json.decode(response.body) as Map <String, dynamic> ;
                    
                    setState(() {
                      hasilresponse = "${data["name"]} - ${data["job"]}";
                    });
              },
              child: Text("Submit")),
          SizedBox(height: 50),
          Divider(),
          SizedBox(height: 10),
          Text(hasilresponse)
        ],
      ),
    );
  }
}
