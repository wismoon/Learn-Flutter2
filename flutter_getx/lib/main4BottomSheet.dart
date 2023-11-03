import 'package:flutter/material.dart';
import 'package:flutter_getx/main1GetX.dart';
import 'package:flutter_getx/main3Dialog.dart';
import 'package:get/get_navigation/get_navigation.dart';
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
        title: Text("Bottom Sheet"),
      ),
      body: Center(
        child: ElevatedButton(onPressed: () {
          // showModalBottomSheet(
          //   context: context, 
          //   builder: (context) => Container(
          //     color: Colors.amber,
          //     child: ListView(
          //       children: [
          //         ListTile(
          //           leading: Icon(Icons.home),
          //           title: Text("Home"),
          //         ),
          //         ListTile(
          //           leading: Icon(Icons.person),
          //           title: Text("Profile"),
          //         )
          //       ],
          //     ),
          //   ),);

          
          Get.bottomSheet(
            Container(
              height: 100,
              color: Colors.amber,
              child: ListView(
                children: [
                  ListTile(
                    leading: Icon(Icons.home),
                    title: Text("Home"),
                  ),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text("Profile"),
                  )
                ],
              ),
          ));
        }, 
        child: Text("Click Me")),
      ),
    );
  }
}