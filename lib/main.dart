import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tax_robot_app/common/utils/index.dart';
import 'package:tax_robot_app/global.dart';

import 'common/router/app_pages.dart';
// import 'package:tax_robot_app/pages/robot/robot.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '税务知识问答',
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        primarySwatch: createMaterialColor(GlobalColor.themeColor),
      ),
    );
  }
}
