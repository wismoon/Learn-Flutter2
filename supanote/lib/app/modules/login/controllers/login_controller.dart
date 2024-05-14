import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supanote/app/routes/app_pages.dart';

class LoginController extends GetxController {

  RxBool isLoading = false.obs;
  RxBool isHidden = false.obs;
  
  TextEditingController emailC = TextEditingController(text: "wisnu@gmail.com");
  TextEditingController passC = TextEditingController(text: "password");

  SupabaseClient client = Supabase.instance.client;

  Future<bool?> login() async{
    if (emailC.text.isNotEmpty && passC.text.isNotEmpty) {
      isLoading.value = true;
      AuthResponse res = await client.auth.signInWithPassword(email: emailC.text, password: passC.text);
      isLoading.value = false;

      if (res.user != null) {
        return true;
      } else {
        Get.snackbar("Terjadi Kesalahan", "error");
      }
      
    } else {
      Get.snackbar("Terjadi kesalahan", "Email atau Password anda belum diisi");
    }
  }


}
