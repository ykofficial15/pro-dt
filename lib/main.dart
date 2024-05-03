import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prodt/controller/news_controller.dart';
import 'view/home.dart';
import 'view/login.dart';

void main() {
    WidgetsFlutterBinding.ensureInitialized();
    Get.put(NewsController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home:Login(),
    );
  }
}
