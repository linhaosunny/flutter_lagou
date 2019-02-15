import 'package:flutter/foundation.dart';

enum TabbarType {
  home,
  company,
  message,
  find,
  mine,
}

String tabbarName(TabbarType type) {
  switch (type) {
    case TabbarType.home:
      return '首页';
    case TabbarType.company:
      return '公司';
    case TabbarType.message:
      return '消息';
    case TabbarType.find:
      return '言职';
    case TabbarType.mine:
      return '我';
  }
}