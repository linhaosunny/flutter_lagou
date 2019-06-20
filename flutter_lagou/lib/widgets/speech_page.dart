import 'package:flutter/material.dart';
import 'package:flutter_lagou/widgets/speech/speech_public.dart';

class SpeechPage extends StatefulWidget {
  @override
  _SpeechPageState createState() => _SpeechPageState();
}

class _SpeechPageState extends State<SpeechPage> with SingleTickerProviderStateMixin {
  final double _appBarHeight = 160.0;
  final List<Tab> _tabMenus = <Tab> [
    new Tab(text: '开悟'),
    new Tab(text: '精选'),
    new Tab(text: '话题'),
    new Tab(text: '专栏'),
  ];
 
  void _leftTabItemPressed() {

  }

  void _rightTabItemPressed() {

  }

  List <Widget> _buildTabView() {
    List <Widget> tabViews = [
      SpeechKaiwu(),
      SpeechJingXuan(),
      SpeechJingXuan(),
      SpeechZhuanlan()
    ];
    return tabViews;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //判断TabBar是否切换
   
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
   
    return new DefaultTabController(
      length: _tabMenus.length,
      child: new Scaffold(
        backgroundColor: new Color.fromARGB(255, 242, 242, 245),
        appBar: new AppBar(
          backgroundColor: Colors.white,
          leading: new Container(
            child: new IconButton(
              icon: Image.asset('images/speech/community_icon_search_18x18_@3x.png',
                width: 22,
                height: 22,
              ),
              onPressed: _leftTabItemPressed,
            ),
          ),
          title: new Container(
            alignment: FractionalOffset.center,
            child: Image.asset('images/speech/icon_community_home_title_50x25_@3x.png',
              width: 60,
              height: 30,
            ),
          ),
          actions: <Widget>[
            new IconButton(
              icon: Image.asset('images/speech/community_icon_mypage_18x21_@3x.png',
                width: 22,
                height: 22,
              ),
              onPressed: _rightTabItemPressed,
            ),
          ],
          bottom: new TabBar(
            tabs: _tabMenus,
            isScrollable: true,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: new Color.fromARGB(255, 15, 185, 125),
            indicatorWeight: 2.0,
            indicatorPadding: EdgeInsets.fromLTRB(8, 0, 8, 2),
            labelColor: Colors.black87,
            labelPadding: new EdgeInsets.only(left: 30.0,right: 30.0),
            labelStyle: new TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),
            unselectedLabelColor: Colors.black54,
            unselectedLabelStyle: new TextStyle(fontSize: 16.0),
          ),
        ),
        body: new TabBarView(
          children: _buildTabView(),
        ),
      )
    );
  }
}