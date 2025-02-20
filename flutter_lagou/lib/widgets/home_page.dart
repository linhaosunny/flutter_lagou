import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_lagou/widgets/home/search_bar.dart';
import 'package:flutter_lagou/widgets/home/home_public.dart';
import 'package:flutter_lagou/public.dart';


class HomePage extends StatefulWidget {
  final double _homeTopBannerHeight = 220;
  final double _homeTopicHeight = 540;
  @override
  State<StatefulWidget> createState() {
  
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  ScrollController scrollController = ScrollController();
  
  List<BannerModel> topBannerDatas = [];
  List<NewsBannerModel> newsBannerDatas = [];
  List<TopicTabModel> topicTabMenus = [];
  List<TopicBottomModel> topicBottomDatas = [];
  List<HomeModel> modules = [];

  double _navAplpha = 0.0;
  double _offset = 0.0;
  bool _mainScrollable = true;
  bool _contentScrollable = true;
  bool _autoScroll = false;
  bool _isTabbarItemClick = false;
  bool _isNavgationBarHidden = false;

  void _rightTabItemPressed() {

  }

  void _leftTabItemPressed() {

    if (_isTabbarItemClick) {
      _isTabbarItemClick = false;
    }
    
    scrollController.animateTo(0.0,duration: new Duration(milliseconds: 300),curve: Curves.linear);
    setState(() {
      this._mainScrollable = true;
      this._contentScrollable = false;
      this._offset = (widget._homeTopicHeight - Screen.navigationBarHeight)*0.5;
    });
    this._autoScroll =true;
  }

  void _statuTabbarItemPressed(int) {
    _isTabbarItemClick = true;

    scrollController.animateTo((widget._homeTopicHeight - Screen.navigationBarHeight)*0.5,duration: new Duration(milliseconds: 300),curve: Curves.linear);
    setState(() {
      this._mainScrollable = false;
      this._contentScrollable =true;
      this._offset = (widget._homeTopicHeight - Screen.navigationBarHeight)*0.5;
    });
    this._autoScroll = true;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    _mainScrollable =true;
    _contentScrollable =false;
    // 滚动视图添加监听
    scrollController.addListener(() {
      var offset = scrollController.offset;
      if (offset < 0) {
        if (_navAplpha != 0) {
          setState(() {
            _navAplpha = 0;
          });
        } 

        setState(() {
          _isNavgationBarHidden = true;
        });
      } else if (offset < widget._homeTopBannerHeight) {
        setState(() {
          _isNavgationBarHidden = false;
          _navAplpha = 1 - (widget._homeTopBannerHeight - offset) / widget._homeTopBannerHeight;
        });
      } else if (_navAplpha != 1) {
        setState(() {
          _isNavgationBarHidden = false;
          _navAplpha = 1;
        });
      }
     
      if (offset > (widget._homeTopicHeight - Screen.navigationBarHeight)*0.5) {
          setState(() {
            this._mainScrollable = false;
            this._contentScrollable =true;
            this._offset = (widget._homeTopicHeight - Screen.navigationBarHeight)*0.5;
          });
          scrollController.animateTo((widget._homeTopicHeight - Screen.navigationBarHeight)*0.5,duration: new Duration(milliseconds: 300),curve: Curves.linear);
        } else {

          if (this._autoScroll) {
            this._autoScroll = false;
          } else {
            if (!_isTabbarItemClick) {
              setState(() {
                this._offset = offset;
              });
            }    
          }
          
        }
      
    });

    fetchData();
  }

  Future<void> fetchData() async {
    try {
      var action = 'home_topicdata';
      var responseJson = await Request.post(action: action);
      List moduleData = responseJson['module'];
      List <HomeModel> modules = [];
      moduleData.forEach((data) {
        modules.add(HomeModel.fromJson(data));
      });

      setState(() {
        this.modules = modules;
        this.topBannerDatas = modules[0].bannerModels;
        this.newsBannerDatas = modules[1].newsModels;
        this.topicTabMenus = modules[2].topicTabMenus;
        this.topicBottomDatas =modules[3].topicBottomModels;
      });

    } catch (e) {
      print('读取错误：' + e.toString());
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  
  Widget _buildHeadPlanContent() {
    return HomeHeadPlan(bannerDatas: topBannerDatas,newsDatas: newsBannerDatas,topicTabMenus: topicTabMenus,topicBottomDatas: topicBottomDatas, height: widget._homeTopicHeight,bannerHeight: widget._homeTopBannerHeight);
  }

  

  Widget _buildContent() {
    
    return CustomScrollView(
      controller: scrollController,
      shrinkWrap: true,
      primary: false,
      physics: _mainScrollable ? ScrollPhysics() : NeverScrollableScrollPhysics() ,
      slivers: <Widget>[
        new SliverToBoxAdapter(
          child: new Listener(
          onPointerUp: _scrollCancel,
          child: new Stack(
            children: <Widget>[
              Positioned(
                top: this._offset < 0 ? -this._offset : 0.0,
                child: _buildHeadPlanContent(),
              ),
              Padding(
                padding: EdgeInsets.only(top: widget._homeTopicHeight - this._offset),
                  child: HomeJobList(
                    contentScrollable: _contentScrollable,
                    tabbarItemClick: _statuTabbarItemPressed,
                  ),
              )
            ],
          ) ,
        ),
        ),
      ],
    );

    
  }

  Widget _buildNavBar() {
    return new Container(
            height: Screen.navigationBarHeight,
            child: new AppBar(
              backgroundColor: Colors.white.withOpacity(_navAplpha),
              elevation: _navAplpha == 1 ? 0.2: 0.0,
              leading: _mainScrollable ? null: new IconButton(
                icon: Image.asset('images/home/first_updown_icon_17x13_@3x.png',
                  width: 17,
                  height: 13,
                  color: Color.lerp(Colors.white, Colors.black45, _navAplpha),
                ),
                onPressed: _leftTabItemPressed,
              ),
              titleSpacing: _mainScrollable ? 7.0 : 0.0,
              centerTitle: true,
              title: _isNavgationBarHidden ? null: FSearchBar('images/home/icon_home_search_20x20_@3x.png',height: 32,
                backgroudColor: Color.lerp(Colors.white, Colors.black12, _navAplpha),
              ),
              actions: _isNavgationBarHidden ? null: <Widget>[
                new IconButton(
                    icon: Image.asset('images/home/icon_resume_edit_saoYsao_20x20_@3x.png',
                      width: 20,
                      height: 20,
                      color: Color.lerp(Colors.white, Colors.black45, _navAplpha),
                    ),
                    onPressed: _rightTabItemPressed,
                  ),
              ],
              bottomOpacity: 0,
            )
          );
  }

  void _scrollCancel(detail) {

      _scrollRelease();
  }

  void _scrollRelease() {
    var offset = scrollController.offset;
    // print('offset :' + offset.toString());
    if (offset < (widget._homeTopicHeight - Screen.navigationBarHeight) * 0.25) {
      if (offset > 0) {
        scrollController.animateTo(0.0,duration: new Duration(milliseconds: 300),curve: Curves.linear);
      }
    } else {
      setState(() {
        this._mainScrollable = false;
        this._contentScrollable =true;
      });
      scrollController.animateTo((widget._homeTopicHeight - Screen.navigationBarHeight)*0.5,duration: new Duration(milliseconds: 300),curve: Curves.linear);
    }
  }
  @override
  Widget build(BuildContext context) {
    
    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            top: 0.0,
            child: _buildContent(),
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            top: 0.0,
            child: _buildNavBar()
          )
          
        ],
      ),
    );
  }
}

class Choice {
  const Choice({required this.title,required this.icon,required this.position});
  final String title;
  final int position;
  final IconData icon;
}