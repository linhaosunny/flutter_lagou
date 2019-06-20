import 'package:flutter/material.dart';
import 'package:flutter_lagou/widgets/company/company_public.dart';

class CompanyPage extends StatefulWidget {
  final ValueChanged<bool> isShowBottomTabbar;
  CompanyPage({Key key,this.isShowBottomTabbar}):super(key:key);

  @override
  _CompanyPageState createState() => _CompanyPageState();
}

class _CompanyPageState extends State<CompanyPage> {
  final List<Tab> _tabMenus = <Tab> [
    new Tab(text: '榜单'),
    new Tab(text: '公司库'),
  ];
  bool isScrollEnable = true;

  Decoration customIndicator(Color indicatorColor,EdgeInsetsGeometry indicatorPadding,double indicatorWeight,double indicatorWidth) {
    return CustomUnderlineTabIndicator(
      insets: indicatorPadding,
      borderSide: BorderSide(
        width: indicatorWeight,
        color: indicatorColor
      ),
      width: indicatorWidth
    );
  }

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: _tabMenus.length,
      child: new Scaffold(
        backgroundColor: new Color.fromARGB(255, 242, 242, 245),
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: new TabBar(
            tabs: _tabMenus,
            isScrollable: true,
            indicator: customIndicator(new Color.fromARGB(255, 15, 185, 125), 
            EdgeInsets.fromLTRB(8, 0, 8, 2), 2.0,20.0),
            // indicatorSize: TabBarIndicatorSize.label,
            // indicatorColor: new Color.fromARGB(255, 15, 185, 125),
            // indicatorWeight: 2.0,
            // indicatorPadding: EdgeInsets.fromLTRB(8, 0, 8, 2),
            labelColor: Colors.black87,
            labelPadding: new EdgeInsets.only(left: 60.0,right: 60.0),
            labelStyle: new TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),
            unselectedLabelColor: Colors.black54,
            unselectedLabelStyle: new TextStyle(fontSize: 16.0),
            onTap: (index) {
              if (index == 0) {
                setState(() {
                isScrollEnable = true;
                widget.isShowBottomTabbar(true);
              });
              }
            },
          ),
          titleSpacing: 0.0,
          elevation: 2.0,
        ),
        body: new TabBarView(
          physics: isScrollEnable ? ScrollPhysics() : NeverScrollableScrollPhysics(),
          children: <Widget>[
            new CompanyBillboard(),
            new CompanyLibsboard(isShowBottomTabbar:(isShow) {
              widget.isShowBottomTabbar(isShow);
              setState(() {
                isScrollEnable = isShow;
              });
            },),
          ],
        ),
      )
    );
  }
}