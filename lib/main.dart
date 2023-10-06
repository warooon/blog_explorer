import 'package:blog_explorer/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/controllers/blog_controller.dart';
import 'package:hive_flutter/hive_flutter.dart';


void main() async {
  await Hive.initFlutter();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final blogController = Get.put(BlogController());

    return GetMaterialApp(
      title: 'Blog Explorer',
      initialRoute: Routes.BlogListScreen,
      getPages: AppPages.routes,
    );
  }
}
