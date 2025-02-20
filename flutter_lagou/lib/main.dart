import 'package:flutter/material.dart';
import 'package:flutter_lagou/widgets/guide_page.dart';
import 'package:flutter_lagou/main_page.dart';
import 'package:flutter_lagou/page_routes.dart';

import 'dart:io';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());

  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
} 

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '拉勾',
      theme: ThemeData(
        primaryIconTheme: const IconThemeData(color: Colors.white),
        brightness: Brightness.light,
        primaryColor: new Color.fromARGB(255, 15, 185, 125),
      ),
      home: GuidePage(),
      routes: PageRoutes.getRoutes(),
    );
  }
}
