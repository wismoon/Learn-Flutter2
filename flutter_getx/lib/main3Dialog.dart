import 'package:flutter/material.dart';
import 'package:flutter_getx/main1GetX.dart';
import 'package:get/get.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dialog Widget"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // showDialog(
            //   context: context, 
            //   builder: (context) => AlertDialog(
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(20)
            //     ),
            //     title: Text("Dialog 1"),
            //     content: Text("text dialog 1"),
            //   ),);
            Get.defaultDialog(
              title: "Dialog 2",
              content: Text("Isi Dialog 2"),
              
            );
          }, 
          child: Text("Dialog"))),
    );
  }
}