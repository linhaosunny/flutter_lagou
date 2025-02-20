import 'package:flutter/material.dart';
import 'package:flutter_lagou/widgets/message/message_public.dart';
import 'package:flutter_lagou/public.dart';
import 'dart:math';
import 'dart:io';

class MsgItem extends StatefulWidget {
  final MsgContentModel model;

  MsgItem({Key? key,required this.model}) :super(key:key);

  @override
  _MsgItemState createState() => _MsgItemState();
}

class _MsgItemState extends State<MsgItem> {

  Widget _buildTipMessage() {
    return new Container(
          height: 30,
          margin: EdgeInsets.only(left: Screen.width * 0.2,top: 20.0, right: Screen.width * 0.2,bottom: 20.0),
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(3.0)
          ),
          child: new Center(
            child: new Text(widget.model.postMessage ?? '',style: new TextStyle(fontSize: 14.0,color: Colors.black54)),
          ),
        );
  }

  Widget _buildJobMessage() {
    return new Container(
          height: 100,
          margin: EdgeInsets.only(left: 15.0,top: 20.0, right: 15.0,bottom: 20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.0),
            border: Border.all(width: 0.5,color: new Color.fromARGB(255, 242, 242, 245)),
          ),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(
                margin: EdgeInsets.only(left: 15.0,top: 15.0,right: 15.0),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(widget.model.postJob?.jobName ?? '', style:new TextStyle(fontSize:16.0,color:Colors.black,fontWeight: FontWeight.w400),softWrap: false,overflow: TextOverflow.ellipsis,maxLines: 1,),
                    new Text(widget.model.postJob?.jobSalary ?? '', style: new TextStyle(fontSize:13.0,color:Colors.deepOrange,fontWeight: FontWeight.w400),)
                  ],
                ),
              ),
              new Container(
                margin: EdgeInsets.only(left: 15.0,top: 5.0,right: 15.0),
                child: new Text(widget.model.postJob?.jobCompany ?? '',style:new TextStyle(fontSize:15.0,color:Colors.black54),softWrap: false,overflow: TextOverflow.ellipsis,maxLines: 1,),
              ),
              new Container(
                margin: EdgeInsets.only(left: 15.0,top: 5.0,right: 15.0),
                child: new Text((widget.model.postJob?.jobCity ?? '') + '/' + (widget.model.postJob?.jobWorkYear ?? '') + '/' + (widget.model.postJob?.jobEducation ?? ''),
                  style: new TextStyle(fontSize:13.0,color:Colors.black38)
                ),
              )
            ],
          ),
        );
  }

  ImageProvider _headImageWithUrl( String url) {
    bool isNetworkUrl = url.contains('http') || url.contains('https');

    if (isNetworkUrl) {
      return NetworkImage(url);
    } else {
      return AssetImage(url);
    }
  }

  List<Widget> _buildCommonContent(ChatMessageUserType type, Widget content) {

    switch (type) {
      case ChatMessageUserType.other:
      return <Widget>[
        new Container(
          child: new CircleAvatar(
            radius: 25.0,
            backgroundImage: _headImageWithUrl(widget.model.headImage),
          ),
        ),
        new Flexible(
          child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: Screen.width - 100,
                minWidth: Screen.width - 320,
              ),
              child: new Container(
              margin: EdgeInsets.only(left: 10.0, right: 10),
              width: Screen.width - 100,
              child: new Container(
                margin: EdgeInsets.only(left: 25,top: 15.0,right: 5.0,bottom: 15.0),
                child: content,
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/message/icon_chat_bubble_other_38x38.png'),
                  centerSlice: Rect.fromLTWH(18, 18, 10, 10),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          )
        )
      ];
      case ChatMessageUserType.myself:
       return <Widget>[
           new Flexible(
            child:  ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: Screen.width - 100,
                minWidth: Screen.width - 320,
              ),
              child: new Container(
                margin: EdgeInsets.only(left: 10.0, right: 10),
                child: new Container(
                  margin: EdgeInsets.only(left: 15.0,top: 15.0,right: 20.0,bottom: 15.0),
                  child: content,
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/message/icon_chat_bubble_self_38x38.png'),
                    centerSlice: Rect.fromLTWH(18, 18, 10, 10),
                    fit: BoxFit.fill
                  ),
                ),
              ),
            ),
          ),
          new Container(
            child: new CircleAvatar(
              radius: 25.0,
              backgroundImage: _headImageWithUrl(widget.model.headImage),
            ),
          )
        ];
    }
  }

  MainAxisAlignment getMessageMainAxisAlignment(ChatMessageUserType type) {
    switch (type) {
      case ChatMessageUserType.myself:
        return MainAxisAlignment.end;
        case ChatMessageUserType.other:
        return MainAxisAlignment.start;
    }
  }

  Widget _buildCommonMessage(ChatMessageUserType type, Widget content) {
    return new Container(
      margin: EdgeInsets.only(left: 15.0,right: 15.0,top: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new Text(widget.model.date,style: new TextStyle(fontSize: 14.0,color: Colors.black54),),
          new Container(
            margin: EdgeInsets.only(top: 5.0),
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: getMessageMainAxisAlignment(type),
              children: _buildCommonContent(type, content),
            ),
          )   
        ],
      ),
    );
  }



  Widget _buildTextOtherMessage() {
    return _buildCommonMessage(widget.model.from, new Text(widget.model.textContent));
  }

  Widget _buildPictureOtherMessage() {
    return _buildCommonMessage(widget.model.from,  Image.file(widget.model.pictureFile,fit: BoxFit.fitWidth,));
  }

  Widget _buildContent() {

    switch (widget.model.type) {
      case ChatMessageType.tipMessage:
        return _buildTipMessage();
      case ChatMessageType.jobMessage:
        return _buildJobMessage();
      case ChatMessageType.textMessage:
        return _buildTextOtherMessage();
      case ChatMessageType.inviteJobMessage:
        return _buildTextOtherMessage();
      case ChatMessageType.pictureMessage:
        return _buildPictureOtherMessage();
      default:
    }
    return new Container();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildContent(),
    );
  }
}