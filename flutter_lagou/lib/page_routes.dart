import 'package:flutter/material.dart';
import 'package:flutter_lagou/main_page.dart';
import 'package:flutter_lagou/widgets/guide_page.dart';
import 'package:flutter_lagou/widgets/newfeatures_page.dart';
import 'package:flutter_lagou/widgets/message/hr_chat.dart';

class PageRoutes {
  static String GUIDE_PAGE = '/';
  static String HOME_PAGE = '/home';
  static String NEWFEATURE_PAGE = '/newfeature';
  static String MESSAGECHATHR_PAGE= '/message/hrchat';

  static Map<String,WidgetBuilder> getRoutes() {
    var route = {
      HOME_PAGE:(BuildContext context) {
        return MyHomePage(title: '拉勾');
      },
      NEWFEATURE_PAGE:(BuildContext contenxt) {
        return NewFeaturesPage(themeColor: Color.fromARGB(255, 15, 185, 125),);
      },
      MESSAGECHATHR_PAGE:(BuildContext context) {
        return HRChat(themeColor: Color.fromARGB(255, 15, 185, 125),);
      }
    };

    return route; 
  }

}