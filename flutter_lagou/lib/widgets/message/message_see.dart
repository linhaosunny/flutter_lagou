import 'package:flutter/material.dart';
import 'package:flutter_lagou/widgets/message/message_public.dart';
import 'package:flutter_lagou/public.dart';

class MessageSee extends StatefulWidget {
  final Color themeColor;

  MessageSee({Key? key,required this.themeColor}):super(key:key);
  @override
  _MessageSeeState createState() => _MessageSeeState();
}

class _MessageSeeState extends State<MessageSee> {
  
  List<SeeHRModel> models = [];

  Future<void> fetchData() async {
    try {
      var action = 'message_see';
      var responseJson = await Request.post(action: action);
      List moduleData = responseJson['module'];

      moduleData.forEach((data){
        BaseModel.fromJson(data, "seeMeHRList", (data) {
          models.add(SeeHRModel.fromJson(data));
        });
      });
      print(models.length);
      setState(() {
      });

    } catch (e) {
      print('读取错误：' + e.toString());
    }

  }


  Widget _buildTipMessage() {
    return new Container(
        height: kTextTabBarHeight,
        color: widget.themeColor.withOpacity(0.1),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Container(
              margin: EdgeInsets.only(left: 15.0),
              child: new Text("看过我的HR有哪些匹配我的职位",style:new TextStyle(fontSize:15.0,color:widget.themeColor)),
            ),
            new Container(
              margin: EdgeInsets.only(right: 15.0),
              height: kTextTabBarHeight - 15.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular((kTextTabBarHeight - 15.0) * 0.5),
                border: new Border.all(color: widget.themeColor,width: 1.0),
              ),
              padding: EdgeInsets.only(left: 10.0,right: 10.0,bottom: 5.0,top: 5.0),
              child: new Center(
                child: new Text("前往(1)",style:new TextStyle(fontSize:13.0,color:widget.themeColor)),
              ),
            )
          ],
        ),
      );
  }

  Widget _buildContent() {
    return new Container(
      color: Colors.white,
      child: Column(
        children: models.map((model) {
          return SeeHRItem(model: model);
        }).toList(),
      ),
    );
  }
  
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body:
       new Stack(
        children: <Widget>[
          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            top: kTextTabBarHeight,
            child: new Container(
              color: Colors.white,
              child: _buildContent(),
            ),
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            top: 0.0,
            child: _buildTipMessage()
          )
          
        ],
       ),
    );
  }
}