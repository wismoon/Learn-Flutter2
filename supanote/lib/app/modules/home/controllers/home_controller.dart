import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supanote/app/routes/app_pages.dart';

class HomeController extends GetxController {
  
  SupabaseClient client = Supabase.instance.client;
  void logout() async{
    await client.auth.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }
}
