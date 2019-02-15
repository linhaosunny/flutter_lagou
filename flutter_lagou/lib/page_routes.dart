import 'package:flutter/material.dart';
import 'package:flutter_lagou/main_page.dart';
import 'package:flutter_lagou/widgets/guide_page.dart';

class PageRoutes {
  static String GUIDE_PAGE = '/';
  static String HOME_PAGE = '/home';

  static Map<String,WidgetBuilder> getRoutes() {
    var route = {
      HOME_PAGE:(BuildContext context) {
        return MyHomePage(title: '拉勾');
      }
    };

    return route; 
  }

}