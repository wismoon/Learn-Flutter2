import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:supanote/app/controllers/auth_controller.dart';
import 'package:supanote/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  final authC = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () async {
            await controller.logout();
            await authC.reset();
            Get.offAllNamed(Routes.LOGIN);
          }, 
          icon: Icon(Icons.logout))
        ],
      ),
      body: const Center(
        child: Text(
          'HomeView',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
