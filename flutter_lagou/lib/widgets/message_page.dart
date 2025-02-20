import 'package:flutter/material.dart';
import 'package:flutter_lagou/widgets/message/message_public.dart';

class MessagePage extends StatefulWidget {
  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> with SingleTickerProviderStateMixin {
  bool isTapTopBar = false;
  bool isScrollEnable = false;
  int _lastIndex = 0;

  Widget _buildTabItem(int index) {
    return index == 0 ? new Tab(child: new Row(
      children: <Widget>[
        new Text('全部沟通'),
        Padding(
          padding: EdgeInsets.only(left: 5.0),
          child: AnimationArray(
            container: new Container(
              width: 12,
              height: 6,
              child: new Image.asset('images/company/company_icon_arrow2_normal_7x4_@3x.png',color: Colors.black,),
            ),
            isForward: isTapTopBar,
            isReverse: !isTapTopBar,
          ),
        ) 
        
      ],
    ),): Tab(text: "谁看过我",);
  }

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

  void showPopMenu() {

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: 2,
      child: new Scaffold(
        backgroundColor: new Color.fromARGB(255, 242, 242, 245),
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: new TabBar(
            tabs: <Tab>[
              Tab(child:_buildTabItem(0)),
              Tab(child:_buildTabItem(1))
            ],
            isScrollable: true,
            indicator: customIndicator(new Color.fromARGB(255, 15, 185, 125), 
            EdgeInsets.fromLTRB(8, 0, 8, 2), 2.5,20.0),
            labelColor: Colors.black87,
            labelPadding: new EdgeInsets.only(left: 40.0,right: 40.0,bottom: 7.0),
            labelStyle: new TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),
            unselectedLabelColor: Colors.black54,
            unselectedLabelStyle: new TextStyle(fontSize: 18.0),
            onTap: (index) {
              if (_lastIndex != index) {
                _lastIndex = index;
              } else {
                if (index == 0) {
                  setState(() {
                    isTapTopBar = !isTapTopBar;
                  });
                  showPopMenu();
                }
              }
            },
            
          ),
          titleSpacing: 0.0,
          centerTitle: true,
          elevation: 0.5,
        ),
        body: new TabBarView(
          physics: isScrollEnable ? ScrollPhysics() : NeverScrollableScrollPhysics(),
          children: <Widget>[
            MessageChat(themeColor:  Color.fromARGB(255, 15, 185, 125),),
            MessageSee(themeColor:  Color.fromARGB(255, 15, 185, 125),),
          ],
        ),
      )
    );
  }
}