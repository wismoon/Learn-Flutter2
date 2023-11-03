import 'package:flutter/material.dart';
import 'package:flutter_getx/controller/Home_controller.dart';
import 'package:get/get.dart';

class HomePage1 extends StatelessWidget {
  final homeC = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            //obx digunakan untuk tipe data obs 
            // Obx(() => Text(
            //   "${homeC.dataPantau}",
            //   style: TextStyle(fontSize: 20),)
            // ),

            //getbuilder digunakan ketika menggunakan simple state
            GetBuilder<HomeController>(
              builder: (controller) => Text(
              "${homeC.dataPantau}",
              style: TextStyle(fontSize: 20),),
            ),

            //button reactive state management
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed:() {
                homeC.tambahData();
              }, 
              child: Text("Tambah Data")
            ),

            //button simple state management
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed:() {
                homeC.refreshTampilan();
              }, 
              child: Text("Refresh Tambah Data")
            )
          ],
        ),
      ),
    );
  }
}