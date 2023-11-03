import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomePahe(),
    );
  }
}

class HomePahe extends StatelessWidget {
  final ctrl = Get.put(SumController());

  @override
  Widget build(BuildContext context) {
    print("render scaffold");
    return Scaffold(
      appBar: AppBar(
        title: Text("GetX"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () {
                print("TEXT di render");
                return Text("${ctrl.data.value}", style: TextStyle(fontSize: 60),);
              },
            ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: () {
                  ctrl.decrement();
                }, 
                child: Text("-")),
                ElevatedButton(onPressed: () {
                  ctrl.increment();
                }, 
                child: Text("+"))
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SumController extends GetxController{
  var data = 0.obs;
  increment(){
    data = data + 1;
  }
  decrement(){
    data = data - 1;
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: homepage(),
//     );
//   }
// }

// class homepage extends StatefulWidget {
  
//   @override
//   State<homepage> createState() => _homepageState();
// }

// class _homepageState extends State<homepage> {
//   int data = 0;

//   @override
//   Widget build(BuildContext context) {
//     print("di render");
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("getX Stateless"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               "${data}",
//               style: TextStyle(fontSize: 50),
//             ),
//             SizedBox(height: 30,),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ElevatedButton(onPressed: () {
//                   setState(() {
//                     data -= 1;
//                     print(data);
//                   });
//                 }, 
//                 child: Text(" - ")),
//                 ElevatedButton(onPressed: () {
//                   setState(() {
//                     data += 1;
//                     print(data);
//                   });
//                 }, 
//                 child: Text(" + "))
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }