import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:test_big_io_mobile_dev/page/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const GetMaterialApp(
      title: 'Big io Mobile Dev',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
