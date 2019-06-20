import 'package:flutter/material.dart';
import 'package:flutter_lagou/widgets/message/message_public.dart';
import 'package:flutter_lagou/public.dart';

class MessageChat extends StatefulWidget {
  final Color themeColor;

  MessageChat({Key key,this.themeColor}):super(key:key);
  @override
  _MessageChatState createState() => _MessageChatState();
}

class _MessageChatState extends State<MessageChat> {

  MessageChatModel chatModel = MessageChatModel();

  Future<void> fetchData() async {
    try {
      var action = 'message_contact';
      var responseJson = await Request.post(action: action);
      List moduleData = responseJson['module'];

      chatModel = MessageChatModel.fromJson(moduleData);

      setState(() {
      });

    } catch (e) {
      print('读取错误：' + e.toString());
    }

  }

  void _goHRChatPage() {
    Navigator.of(context).pushNamed(PageRoutes.MESSAGECHATHR_PAGE);
  }

  Widget _buildChatCard() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.white,
        border: Border.all(color: Colors.black12,width: 0.6),
        boxShadow: [BoxShadow(color: Colors.black12,offset: Offset(3.0, 3.0),blurRadius:3.0 ,spreadRadius: 1.0)]
      ),
      child: new Container(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              margin: EdgeInsets.only(left: 15.0,top: 10.0,right: 10.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Container(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Container(
                          margin: EdgeInsets.only(top: 10.0),
                          child: new Text("聊出好机会", style: new TextStyle(fontSize:18.0,color:Colors.black)),
                        ),
                        new Container(
                          margin: EdgeInsets.only(top: 5.0),
                          child: new Text("以下职位发布者回复超快，聊聊看",style:new TextStyle(fontSize:14.0,color:Colors.black45)),
                        ),
                      ],
                    ),
                  ),
                  new Container(
                    child: new Image.asset(
                      'images/message/icon_activty_chatchance_62x69_@3x.png',
                      width: 52.0,
                      height: 59.0,
                    ),
                  ),
                ],
              ),
            ),
            new Container(
              margin: EdgeInsets.only(left: 15.0,top: 10.0,right: 10.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Headlist(items: chatModel.quikContacts,height: 25.0,),
                  new Container(
                    child: new Row(
                      children: <Widget>[
                        new Container(
                          child: new Text(chatModel.contactList.length.toString() + '位', style:new TextStyle(fontSize:13.0,color:Colors.black45)),
                        ),
                        new Icon(Icons.chevron_right,color: Colors.grey,size: 16.0,)
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    return new CustomScrollView(
        slivers: <Widget>[
          new SliverList(
            delegate: new SliverChildListDelegate(
              <Widget>[
                new Container(
                  height: 130,
                  margin: const EdgeInsets.only(
                    top: 20.0,
                    left: 15.0,
                    right: 15.0,
                    bottom: 10.0
                  ),
                  child: _buildChatCard(),
                ),
                new Container(
                  color: Colors.white,
                  child: Column(
                    children: chatModel.contactList.map((model) {
                      return new InkWell(
                        onTap: () {
                          _goHRChatPage();
                        },
                        child: ContactItem(model: model,height: 80,themeColor: widget.themeColor,),
                      );
                    }).toList(),
                  ),
                )
              ]
            ),
          )
        ],
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
            top: 0.0,
            child: _buildContent(),
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            top: 0.0,
            child: new Container(
            )
          )
          
        ],
       ),
    );
  }
}