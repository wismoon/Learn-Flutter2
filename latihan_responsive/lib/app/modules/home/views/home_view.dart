import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  double widthDevice =   MediaQuery.of(context).size.width;
  double heightDevice =   MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Container(
        width: widthDevice * 0.5,
        height: heightDevice,
        color: Colors.red,
      )
    );
  }
}
