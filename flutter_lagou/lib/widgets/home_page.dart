import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_lagou/widgets/home/search_bar.dart';
import 'package:flutter_lagou/widgets/utility/screen.dart';
import 'package:flutter_lagou/widgets/home/home_banner.dart';
import 'package:flutter_lagou/widgets/home/home_public.dart';
import 'package:flutter_lagou/public.dart';


class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
  
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  ScrollController scrollController = ScrollController();
  List<BannerModel> bannerInfos = [];
  List<HomeModel> modules = [];
  List<Choice> tabs = [];
  TabController mTabController;
  int mCurrentPosition = 0;
  double _navAplpha = 0.0;

  void _rightTabItemPressed() {

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabs.add(Choice(title: '热门', icon: Icons.hot_tub, position: 0));
    tabs.add(Choice(title: '最新', icon: Icons.fiber_new, position: 1));
    mTabController = new TabController(vsync: this,length: tabs.length);
    //判断TabBar是否切换
    mTabController.addListener(() {
      if (mTabController.indexIsChanging) {
        setState(() {
          mCurrentPosition = mTabController.index;
        });
      }
    });
    
    // 滚动视图添加监听
    scrollController.addListener(() {
      var offset = scrollController.offset;
      if (offset < 0) {
        if (_navAplpha != 0) {
          setState(() {
            _navAplpha = 0;
          });
        } 
      } else if (offset < Screen.navigationBarHeight) {
        setState(() {
          _navAplpha = 1 - (Screen.navigationBarHeight - offset) / Screen.navigationBarHeight;
        });
      } else if (_navAplpha != 1) {
        setState(() {
          _navAplpha = 1;
        });
      }

      if (_navAplpha != 1) {
        print("透明");
      } else {
        print("不透明");
      }

      print(Screen.navigationBarHeight);
    });

    fetchData();
  }

  Future<void> fetchData() async {
    try {
      var action = 'home_promo';
      var responseJson = await Request.post(action: action);
      List moduleData = responseJson['module'];
      List <HomeModel> modules = [];
      moduleData.forEach((data) {
        modules.add(HomeModel.fromJson(data));
      });

      setState(() {
        this.modules = modules;
        this.bannerInfos = modules[0].bannerModels;
        print(bannerInfos);
      });

    } catch (e) {
      print('读取错误：' + e.toString());
    }
    print(Screen.navigationBarHeight);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    mTabController.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          new NestedScrollView(
            controller: scrollController,
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[SliverOverlapAbsorber(
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                child: SliverAppBar(
                  primary: false,
                  pinned: true,
                  expandedHeight: 340,
                  backgroundColor: Colors.white,
                  flexibleSpace: new FlexibleSpaceBar(
                    centerTitle: true,
                    title: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        // new HomeBanner(bannerInfos)
                        new Container(
                          width: Screen.width,
                          height: 240,
                          color: Colors.red,
                        ),
                        new Container(
                          width: Screen.width,
                          height: 100,
                          color: Colors.green,
                        )
                      ],
                    ),
                    collapseMode: CollapseMode.none,
                  ),
                  bottom:  PreferredSize(
                  preferredSize: Size.fromHeight(Screen.navigationBarHeight + 18),
                  child: new Container(
                      color: Colors.yellow,
                      child: new TabBar(
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorColor: Colors.green,
                      labelColor: Colors.green,
                      unselectedLabelColor: Colors.black45,
                      tabs: tabs.map((Choice choice) {
                        return new Tab(
                          text: choice.title,
                          icon: new Icon(choice.icon,),
                        );
                      }).toList(),
                      controller: mTabController,
                    )
                  ),
                ),
                ),
              )];
            },
            body: new Scaffold(
              backgroundColor: Colors.white,
              body: new TabBarView(children: tabs.map((Choice choice) {
                  return new Padding(
                      padding: const EdgeInsets.only(top: kToolbarHeight + kBottomNavigationBarHeight + kTextTabBarHeight),
                      child:choice.position==0?new Container(
                        child: new ListView(
                          children: <Widget>[
                            new ListTile(
                              leading: new Icon(Icons.map),
                              title: new Text('Map'),
                            ),
                            new ListTile(
                              leading: new Icon(Icons.photo),
                              title: new Text('Album'),
                            ),
                            new ListTile(
                              leading: new Icon(Icons.phone),
                              title: new Text('Phone'),
                            ),
                            new ListTile(
                              leading: new Icon(Icons.map),
                              title: new Text('Map'),
                            ),
                            new ListTile(
                              leading: new Icon(Icons.photo),
                              title: new Text('Album'),
                            ),
                            new ListTile(
                              leading: new Icon(Icons.phone),
                              title: new Text('Phone'),
                            ),
                          ],
                        )
                      ):new Container(
                        child: new Text("ahhhhhhhhhhhhh"),
                      )
                  );
                  }).toList(),
                  controller: mTabController,
                ),
              ),
          ),
          new Container(
            height: Screen.navigationBarHeight,
            child: new AppBar(
              backgroundColor: Colors.white.withOpacity(_navAplpha),
              elevation: _navAplpha == 1 ? 1.0: 0.0,
              title: SearchBar('images/home/icon_home_search_20x20_@3x.png',
                backgroudColor: Color.lerp(Colors.white, Colors.black12, _navAplpha),
              ),
              actions: <Widget>[
                new IconButton(
                    icon: Image.asset('images/home/icon_resume_edit_saoYsao_20x20_@3x.png',
                      width: 25,
                      height: 25,
                      color: Color.lerp(Colors.white, Colors.black12, _navAplpha),
                    ),
                    onPressed: _rightTabItemPressed,
                  ),
              ],
              bottomOpacity: 0,
            )
          ),
        ],
      ),
    );
  }
}

class Choice {
  const Choice({ this.title, this.icon, this.position});
  final String title;
  final int position;
  final IconData icon;
}