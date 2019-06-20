import 'package:flutter/material.dart';
import 'package:flutter_lagou/widgets/message/message_public.dart';
import 'package:flutter_lagou/widgets/message/models/chatbar_model.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:math';
import 'dart:io';
import 'package:flutter_lagou/public.dart';

class HRChat extends StatefulWidget {
  final Color themeColor;

  HRChat({Key key,this.themeColor}):super(key:key);
  @override
  _HRChatState createState() => _HRChatState();
}

class _HRChatState extends State<HRChat> {
  ChatMsgModel chatModel = ChatMsgModel();
  ScrollController  controll = ScrollController();
  double _chatBarHeight = kBottomNavigationBarHeight + kToolbarHeight + 40;
  final double _tipMessageBarHeight = kTextTabBarHeight;
  double _chatListHeight = 0.0;
  double chatListMaxHeight = 0.0;
  Function updateChatbar;
  final _chatListKey = GlobalKey();

  void rightNavgationBarClick() {

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return new Container(
          color: Colors.white,
          height: 280,
        );
      }
    );
  }

  Future<void> fetchData() async {
    try {
      var action = 'chatmsg0234578';
      var responseJson = await Request.post(action: action);
      List moduleData = responseJson['module'];

      chatModel = ChatMsgModel.fromJson(moduleData);

      setState(() {
      });

    } catch (e) {
      print('读取错误：' + e.toString());
    }

  }

  Widget _buildChatList() {
    return new SingleChildScrollView(
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _buildMessageList(),
          _buildChatTabbar()
        ],
      ),
    );
  }

  Widget _buildTipMessage() {
    return new Container(
      color: Colors.black.withOpacity(0.0),
      height: _tipMessageBarHeight,
      child: new Container(
        margin: EdgeInsets.only(left: 15.0,right: 15.0),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Container(
              child: new Image.asset(
                'images/message/icon_top_tip_16x16_@3x.png',
                fit: BoxFit.cover,
                width: 25,
                height: 25,
              )
            ),
            new Expanded(
              child: new Container(
                margin: EdgeInsets.only(left: 10.0),
                child: new Text('聊得不错，记得发份简历哦',style:new TextStyle(fontSize:14.0,color:Colors.black54)),
              ),
            ),
            new Container(
              margin: EdgeInsets.only(right: 10.0),
              child: new Image.asset(
                'images/message/icon_chat_prompt_separator_1x16_@3x.png',
                fit: BoxFit.cover,
                width: 1.1,
                height: 18,
              )
            ),
            new Container(
              child: new Text('发简历',style:new TextStyle(fontSize:15.0,color:widget.themeColor)),
            )
          ]
        ),
      ),
    );  
  }

  Widget _buildMessageList() {
    print(_chatListHeight);
    return  new Container(
      height: _chatListHeight,
      color: new Color.fromARGB(255, 242, 242, 245),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: ListView(
          controller: controll,
          key: _chatListKey,
          children: chatModel.messages.map((model) {
            return MsgItem(model: model);
          }).toList(),
        ),
      ),
    );
  }

  void _scrollListViewToBottom() {
    final listViewHeight = _chatListKey.currentContext.size.height;
    print('height');
    controll.animateTo(listViewHeight,duration: new Duration(milliseconds: 300),curve: Curves.easeOut);
  }

  void _openImageSelector(ImageSource type) async {
    File imageFile = await ImagePicker.pickImage(source: type);

    MsgContentModel model = MsgContentModel(
                    type: ChatMessageType.pictureMessage,
                  );
    model.date = "12:54";
    model.pictureFile = imageFile;
    model.headImage = 'images/mine/default_mine.jpg';
    model.from = ChatMessageUserType.myself;
    model.type = ChatMessageType.pictureMessage;

    chatModel.messages.add(model);

    print('offset' + controll.offset.toString());
    setState(() {
      
    });
    _scrollListViewToBottom();
  }


  Widget _buildChatTabbar() {
    return new ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: _chatBarHeight,
        maxHeight: _chatBarHeight + 14*4
      ),
      child: new Container(
        color: Color.fromARGB(255, 242, 242, 245),
        height: _chatBarHeight,
        child: new Column(
          children: <Widget>[
            new Container(
              color: Colors.black12,
              height: 0.8,
            ),
            new Container(
              child: ChatBar(
                themeColor: widget.themeColor,
                onChatBarItemClick: (item) {
                  print(item);
                  if (item == ChatBarItemType.camera) {
                    _openImageSelector(ImageSource.camera);
                  } else if (item == ChatBarItemType.picture) {
                    _openImageSelector(ImageSource.gallery);
                  }
                },
                onTextFieldMuiltLineHeightChanged: (height) {
                  print(height);
                   _chatListHeight = chatListMaxHeight - height;
                  _chatBarHeight = kBottomNavigationBarHeight + kToolbarHeight + 40 + height;
                  setState(() {
                    
                  });
                  if (updateChatbar != null) {
                    updateChatbar();
                  } 
                },
                onVisibleFocusechanged: (function) {
                  updateChatbar = function;
                },
                onCompletedTextInput: (text) {
                  print(text);
                  MsgContentModel model = MsgContentModel(
                    type: ChatMessageType.textMessage,
                  );
                  model.date = "12:54";
                  model.textContent = text;
                  model.headImage = 'images/mine/default_mine.jpg';
                  model.from = ChatMessageUserType.myself;
                  model.type = ChatMessageType.textMessage;

                  chatModel.messages.add(model);
              
                  print('offset' + controll.offset.toString());
                  setState(() {
                    
                  });
                  _scrollListViewToBottom();
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    return new Stack(
      children: <Widget>[
        Positioned(
            left: 0.0,
            right: 0.0,
            top: kTextTabBarHeight,
            bottom: 0.0,
            child: new Container(
              color: Colors.white,
              child: _buildChatList(),
            ),
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            top: 0.0,
            child: _buildTipMessage()
          ),
      ],
      );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 初始化
    chatListMaxHeight = Screen.height - (Screen.navigationBarHeight + _chatBarHeight + _tipMessageBarHeight);
    _chatListHeight = chatListMaxHeight;

    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: new IconButton(
          icon: Image.asset('images/message/icon_back_pre_10x18_@3x.png',
            width: 12,
            height: 20,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions:  <Widget>[
          new IconButton(
              icon: Image.asset('images/message/icon_answer_more_20x20_@3x.png',
                width: 20,
                height: 20,
              ),
              onPressed: () {
                rightNavgationBarClick();
              },
            ),
        ],
        title: new Center(
          child: new Text(chatModel.companyName ?? '',style: new TextStyle(fontSize: 17.0,color: Colors.black),),
        ),
        elevation: 0.0,
      ),
      body: _buildContent(),
    );
  }
}