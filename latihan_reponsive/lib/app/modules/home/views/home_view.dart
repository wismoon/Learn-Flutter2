import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //penggunaan GetX fitur untuk device size
    double widthDevice = Get.width;
    double heightDevice = Get.height;
    double paddingTop = context.mediaQueryPadding.top;
    double paddingBottom = context.mediaQueryPadding.bottom;


    //penggunaan mediaquery dan context untuk device size
    // double widthDevice = MediaQuery.of(context).size.width;
    // double heightDevice = MediaQuery.of(context).size.height;
    // double paddingTop = MediaQuery.of(context).padding.top;
    // double paddingBottom = MediaQuery.of(context).padding.bottom;
    
    AppBar myAppBar() {
      return AppBar(
        title: Text("Home"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      );
    }

    double heightBody = Get.height - myAppBar().preferredSize.height -  paddingTop;

    return Scaffold(
      appBar: myAppBar(),
      body: Column(
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 300,
              minHeight: 100,
              maxHeight: 150
            ),
            child: Container(
              color: Colors.amber,
              child: Text(
                "Haloooooo0",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30
                ),
              ),
            ),
          )
        ],),


      // //penggunaan LayoutBuilder untuk membentuk ukuran dari sebuah container
      // body: Container(
      //   width: widthDevice * 0.5,
      //   height: heightBody * 0.3,
      //   color: Colors.amber,
      //   child: LayoutBuilder(
      //     builder: (context, constraints) {
      //       double tinggiK = constraints.maxHeight;
      //       double lebarK = constraints.maxWidth;
      //       return Stack(
      //         children: [
      //           Container(
      //             width: lebarK * 0.5,
      //             height: tinggiK * 0.5,
      //             color: Colors.black,
      //           )
      //         ],
      //       );
      //     }
      //   ),
      // ),


      // body: Wrap(
      //   direction: Axis.vertical,
      //   children: [
      //     //penggunaan widget expanded membuat suatu bentuk mengikuti sisa bentuk lainnya
      //     Container(
      //           margin: EdgeInsets.all(10),
      //           width: Get.width * 0.15,
      //           height: 20,
      //           color: Colors.amber,
      //       ),
      //       Container(
      //           margin: EdgeInsets.all(10),
      //           width: Get.width * 0.15,
      //           height: 20,
      //           color: Colors.amber,
      //       ),
      //       Container(
      //           margin: EdgeInsets.all(10),
      //           width: Get.width * 0.15,
      //           height: 20,
      //           color: Colors.amber,
      //       ),
      //       Container(
      //           margin: EdgeInsets.all(10),
      //           width: Get.width * 0.15,
      //           height: 20,
      //           color: Colors.amber,
      //       ),
      //       Container(
      //           margin: EdgeInsets.all(10),
      //           width: Get.width * 0.15,
      //           height: 20,
      //           color: Colors.amber,
      //       ),
      //       Container(
      //           margin: EdgeInsets.all(10),
      //           width: Get.width * 0.15,
      //           height: 20,
      //           color: Colors.amber,
      //       ),
      //       Container(
      //           margin: EdgeInsets.all(10),
      //           width: Get.width * 0.15,
      //           height: 20,
      //           color: Colors.amber,
      //       ),
      //       Container(
      //           margin: EdgeInsets.all(10),
      //           width: Get.width * 0.15,
      //           height: 20,
      //           color: Colors.amber,
      //       ),
      //       Container(
      //           margin: EdgeInsets.all(10),
      //           width: Get.width * 0.15,
      //           height: 20,
      //           color: Colors.amber,
      //       )
      //   ],
      // ),
      // body: Column(
      //   children: [
      //     //penggunaan widget expanded membuat suatu bentuk mengikuti sisa bentuk lainnya
      //     Row(
      //       children: [
      //         Expanded(
      //           child: ListTile(
      //             tileColor: Colors.grey,
      //             leading: Icon(Icons.abc_sharp),
      //             title: Text("JUDUL"),
      //           ),
      //         ),
      //         Container(
      //           height: 50,
      //           width: 50,
      //           color: Colors.amber,)
      //       ],
      //     ),
      //   ],
      // ),
      // body: Column(
      //   children: [
      //     //penggunaan widget flexible agar memudahhkan pengaturan ukuran secara bebas atau flexible
      //     Flexible(
      //       flex: 5,
      //       child: Container(
      //         width: widthDevice * 0.5,
      //         color: Colors.blue,
      //       ),
      //     ),
      //   ],
      // ),
      // body: Column(
      //   children: [
      //     Container(
      //       //**Penggunaan mediaquery untuk mengatur width dan height dari suatu device**
      //       width: widthDevice * 0.5,
      //       height: heightBody * 0.5,
      //       color: Colors.blue,
      //     ),
      //     Container(
      //       width: widthDevice * 0.5,
      //       height: heightBody * 0.3,
      //       color: Colors.red,
      //     ),
      //     Container(
      //       width: widthDevice * 0.5,
      //       height: heightBody * 0.2,
      //       color: Colors.green,
      //     ),
      //   ],
      // ),
    );
  }
}
