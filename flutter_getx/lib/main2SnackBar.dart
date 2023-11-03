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
      home: HomeApp(),
    );
  }
}

class HomeApp extends StatelessWidget {
  const HomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SnackBar"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // ScaffoldMessenger.of(context).showSnackBar(
            //   SnackBar(
            //     content: Text("Halo"),
            //     action: SnackBarAction(
            //       label: "cancel", 
            //       onPressed: () {
                    
            //       },),
            //     )
            // );
            Get.snackbar("Halo", "message", snackPosition: SnackPosition.BOTTOM);
          }, 
          child: Text("Open SnackBar")),
      ),
    );
  }
}