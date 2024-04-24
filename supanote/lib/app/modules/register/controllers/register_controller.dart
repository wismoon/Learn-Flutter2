import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supanote/app/routes/app_pages.dart';

class RegisterController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isHidden = false.obs;

  TextEditingController emailC = TextEditingController(text: "wisnu@gmail.com");
  TextEditingController passC = TextEditingController(text: "password");

  SupabaseClient client = Supabase.instance.client;

  void signup() async {
    if (emailC.text.isNotEmpty && passC.text.isNotEmpty) {
      isLoading.value = true;
      AuthResponse res = await client.auth.signUp(
        email: emailC.text, 
        password: passC.text,
        );
      isLoading.value = false;

      if (res.user != null) {
        Get.back();
      } else {
        Get.snackbar("Terjadi Kesalahan", "error");
      }
      // try {
      //   final res =
      //       await client.auth.signUp(email: emailC.text, password: passC.text);
      //   isLoading.value = false;

      //   if (res.user != null) {
      //     Get.back();
      //   }
      // } catch (e) {
      //   isLoading.value = false;
      //   Get.snackbar("Terjadi Kesalahan", e.toString());
      // }
    } else {
      Get.snackbar("Terjadi kesalahan", "Email atau Password anda belum diisi");
    }
  }
}
