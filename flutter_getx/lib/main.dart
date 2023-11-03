import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './pages/HomePage1.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomePage1(),
    );
  }
}