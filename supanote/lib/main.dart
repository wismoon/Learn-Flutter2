import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:supanote/app/controllers/auth_controller.dart';

import 'app/routes/app_pages.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Supabase supabase = await Supabase.initialize(
    url: 
      "https://mkvaktpwcyyuvqqpecqr.supabase.co",
    anonKey: 
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1rdmFrdHB3Y3l5dXZxcXBlY3FyIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTM0OTUzODYsImV4cCI6MjAyOTA3MTM4Nn0.Z8d5eG99ObVw43PVeYbAHYPgpGUzOpkXC8rWVPW_9sk"
  );

  await supabase.client.auth.signOut();
  print("---------------------------------");
  print(supabase.client.auth.currentSession?.toJson());


  final authC = Get.put(AuthController(), permanent: true);

  runApp(
    GetMaterialApp(
      title: "Supanote",
      // initialRoute: supabase.client.auth.currentUser == null ? Routes.LOGIN : Routes.HOME,
      initialRoute: Routes.LOGIN,
      getPages: AppPages.routes,
    ),
  );
}
