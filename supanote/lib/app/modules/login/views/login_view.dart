import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:supanote/app/controllers/auth_controller.dart';
import 'package:supanote/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);

  final authC = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          TextField(
            autocorrect: false,
            controller: controller.emailC,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
                labelText: "Email", border: OutlineInputBorder()),
          ),
          SizedBox(
            height: 20,
          ),
          Obx(() => TextField(
                autocorrect: false,
                obscureText: controller.isHidden.value,
                controller: controller.passC,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () => controller.isHidden.toggle(),
                        icon: controller.isHidden.isTrue
                            ? Icon(Icons.remove_red_eye)
                            : Icon(Icons.remove_red_eye_outlined)),
                    labelText: "Password",
                    border: OutlineInputBorder()),
              )),
          SizedBox(
            height: 20,
          ),
          Obx(
            () => ElevatedButton(
              onPressed: () async{
                if (controller.isLoading.isFalse) {
                  bool? cek = await controller.login();
                  if (cek != null && cek == true) {
                    await authC.authLogout();
                    Get.offAllNamed(Routes.HOME);
                  }
                }
              }, 
              child: Text(controller.isLoading.isFalse ? "Login" : "Loading"))
              ),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: () => Get.toNamed(Routes.REGISTER), child: Text("Register"))
        ],
      ),
    );
  }
}
