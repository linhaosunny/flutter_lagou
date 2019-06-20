import 'package:flutter/material.dart';
import 'package:flutter_lagou/tabbar_type.dart';
import 'package:flutter_lagou/widgets/home_page.dart';
import 'package:flutter_lagou/widgets/mine_page.dart';
import 'package:flutter_lagou/widgets/speech_page.dart';
import 'package:flutter_lagou/widgets/company_page.dart';
import 'package:flutter_lagou/widgets/message_page.dart';



class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TabbarType _lastSelection = TabbarType.home;
  bool isBottomTabbarShow = true;

  
  // 匹配tabbar颜色
  Color _tabbarColorMatching({TabbarType type}) {
    return _lastSelection == type ? Color.fromARGB(255, 15, 185, 125) : Colors.grey;
  }

  void _onTabbarSelected(TabbarType type) {
    setState(() {
      _lastSelection = type;
    });
  }

  // tabbar按钮选中 
  void _onSelectTabbar(int index) {
    switch (index) {
      case 0:
       _onTabbarSelected(TabbarType.home);
       break;
      case 1:
       _onTabbarSelected(TabbarType.company);
       break;
      case 2:
       _onTabbarSelected(TabbarType.message);
       break;
      case 3:
       _onTabbarSelected(TabbarType.find);
       break;
      case 4:
       _onTabbarSelected(TabbarType.mine);
       break;
    }
  }
  
  // 底部Tabbar
  Widget _buildBottomNavBar() {
    final items = [ _buildBottomBarItem(icon: _lastSelection == TabbarType.home ? 'images/tabbar/tabbar_talent_pre@3x.png' : 'images/tabbar/tabbar_talent_nor@3x.png',tabbarSelection: TabbarType.home),
                    _buildBottomBarItem(icon: _lastSelection == TabbarType.company ? 'images/tabbar/tabbar_company_pre@3x.png' : 'images/tabbar/tabbar_company_nor@3x.png',tabbarSelection: TabbarType.company),
                    _buildBottomBarItem(icon: _lastSelection == TabbarType.message ? 'images/tabbar/tabbar_message_pre@3x.png' : 'images/tabbar/tabbar_message_nor@3x.png',tabbarSelection: TabbarType.message),
                    _buildBottomBarItem(icon: _lastSelection == TabbarType.find ? 'images/tabbar/tabbar_find_pre@3x.png' : 'images/tabbar/tabbar_find_nor@3x.png',tabbarSelection: TabbarType.find),
                    _buildBottomBarItem(icon: _lastSelection == TabbarType.mine ? 'images/tabbar/tabbar_setting_pre@3x.png' : 'images/tabbar/tabbar_setting_nor@3x.png',tabbarSelection: TabbarType.mine)];
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: items,
      onTap: _onSelectTabbar,
    );
  }
  
  // 创建TabbarItem
  BottomNavigationBarItem _buildBottomBarItem({String icon,TabbarType tabbarSelection}) {
    String text = tabbarName(tabbarSelection);

    return new BottomNavigationBarItem(
      icon: new Image.asset(
        icon,
        width: 25.0,
        height: 25.0,
      ),
      title: new Text(
        text,
        style: TextStyle(color: _tabbarColorMatching())
      )
    );
  }
  
  // 中间部分框架 
  Widget _buildBody() {
    TabbarType type = _lastSelection;

    switch (type) {
      case TabbarType.home:
        return HomePage();
      case TabbarType.company:
        return CompanyPage(isShowBottomTabbar: (isShow) {
          setState(() {
            isBottomTabbarShow = isShow;
          });
        },);
      case TabbarType.message:
        return MessagePage();
      case TabbarType.find:
        return SpeechPage();
      case TabbarType.mine:
        return MinePage();
    }
  }

  @override
  Widget build(BuildContext context) {
       return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: isBottomTabbarShow ? _buildBottomNavBar() : null, // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
