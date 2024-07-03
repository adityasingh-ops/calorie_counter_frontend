import 'package:fitness/view/main_tab/main_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'common/colo_extension.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Fitness 3 in 1',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // is not restarted.
        primaryColor: TColor.primaryColor1,
        fontFamily: "Poppins"
      ),
      home: const MainTabView(),
    );
  }
}

