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


  // text editing controller untuk membuat tipe apa text editing yang mau kita buat
  TextEditingController nameC = TextEditingController();
  TextEditingController jobC = TextEditingController();


  //membuat variabel string untuk menampung data sebelum di generate
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
            //memanggil text controller langsung untuk memberi banyak fitur 
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
              // post request ke database untuk merubah data yang kita mau 
              onPressed: () async {
                var response = await http.post(Uri.parse("https://reqres.in/api/users"),
                    //menentukan data yang kita ubah dari text controler 
                    body: {"name": nameC.text, "job": jobC.text});
                    //maping untuk isi dari data yang diterima dan diubah menjadi json 
                    Map <String, dynamic> data = json.decode(response.body) as Map <String, dynamic> ;
                    
                    //setstate hasilrespon dengan isian dari data yang kita ubah
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
