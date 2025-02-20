import 'package:flutter/material.dart';
import 'package:flutter_lagou/widgets/home/home_public.dart';
import 'package:flutter_lagou/public.dart';

class HomeJobList extends StatefulWidget {
  final bool contentScrollable;
  final ValueChanged<int> tabbarItemClick;



  HomeJobList({Key? key,required this.contentScrollable,required this.tabbarItemClick}) : super(key:key);

  @override
  _HomeJobListState createState() => _HomeJobListState();
}

class _HomeJobListState extends State<HomeJobList> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<Tab> _tabMenus = <Tab> [
    new Tab(text: '推荐'),
    new Tab(text: '最新'),
  ];
  List<HomeJobsModel> _recommandJobs = [];
  List<HomeJobsModel> _newsJobs = [];

   int _currentPosition = 0;

   void _onTabbarItemPressed(index) {
     widget.tabbarItemClick(index);
   }

   Widget _buildTabViewContent() {
    return new TabBarView(children: _tabMenus.map((Tab tab) {
            return new Padding(
                padding: const EdgeInsets.only(top: 0),
                child:  new Container(
                  color: new Color.fromARGB(255, 242, 242, 245),
                  child: new ListView(
                    padding: EdgeInsets.all(0),
                    physics: widget.contentScrollable ? ScrollPhysics() : NeverScrollableScrollPhysics(),
                    children: _currentPosition == 0 ? 
                      _recommandJobs.map((HomeJobsModel model) {
                        return HomeListItem(jobsModel: model);
                      }).toList()
                    : _newsJobs.map((HomeJobsModel model) {
                      return HomeListItem(jobsModel: model);
                    }).toList(),
                  )
                )
            );
            }).toList(),
            controller: _tabController,
          );
  }

  Widget _buildContentTabbar() {
   return new Column(
     mainAxisAlignment: MainAxisAlignment.end,
     children: <Widget>[
       new Container(
         child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Container(
                padding: EdgeInsets.only(left: 15.0),
                child: new Row(
                  children: <Widget>[
                    new Container(
                      child: new Text("IOS",style: new TextStyle(fontSize: 18.0,color: Colors.black87),),
                    ),
                    new Container(
                      padding: EdgeInsets.only(left: 8.0),
                      child:new Icon(Icons.chevron_right,color: Colors.grey,size: 16.0,) ,
                    )
                    
                  ],
                ),
              ),
              new Container(
                padding: new EdgeInsets.only(bottom: 5,right: 15.0),
                child: new TabBar(
                  tabs: _tabMenus,
                  onTap: _onTabbarItemPressed,
                  controller: _tabController,
                  isScrollable: true,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorColor: new Color.fromARGB(255, 15, 185, 125),
                  indicatorWeight: 2.0,
                  indicatorPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  labelColor: Colors.black87,
                  labelPadding: new EdgeInsets.only(left: 10.0,right: 10.0),
                  labelStyle: new TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,fontFamily: ""),
                  unselectedLabelColor: Colors.black54,
                  unselectedLabelStyle: new TextStyle(fontSize: 16.0),
                ),
              )
            ],
          ),
       ),
       new Container(
         height: 0.8,
         color: new Color.fromARGB(255, 242, 242, 245),
       )
     ],
   );
 }

 Future<void> fetchData() async {
    try {
      var action = 'home_jobs';
      var responseJson = await Request.post(action: action);
      List moduleData = responseJson['module'];
    
      moduleData.forEach((data) {
        BaseModel.fromJson(data, "recommandjobs", (data) {
          _recommandJobs.add(HomeJobsModel.fromJson(data))  ;
        });
        BaseModel.fromJson(data, "newsjobs", (data) {
          _newsJobs.add(HomeJobsModel.fromJson(data))  ;
        });
        
      });

      setState(() {
 
      });

    } catch (e) {
      print('读取错误：' + e.toString());
    }
    // print(Screen.navigationBarHeight);
  }

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
  
    _tabController = new TabController(vsync: this,length: _tabMenus.length);
    //判断TabBar是否切换
    _tabController.addListener(() {
      setState(() {
          _currentPosition = _tabController.index;
      }); 
    });

    fetchData();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
          children: <Widget>[
              new Container(
                  color: Colors.white,
                  width: Screen.width,
                  height: kBottomNavigationBarHeight,
                  child: _buildContentTabbar()
              ),
              new Container(
                color: Colors.white,
                height:Screen.height - Screen.navigationBarHeight - kBottomNavigationBarHeight*2,
                child: DefaultTabController(
                  length: _tabMenus.length,
                  child: _buildTabViewContent(),
                )
              )
          ],
        );
  }
}