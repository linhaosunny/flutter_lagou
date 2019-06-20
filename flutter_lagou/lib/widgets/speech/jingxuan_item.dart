import 'package:flutter/material.dart';
import 'package:flutter_lagou/widgets/speech/speech_public.dart';

class JingxuanItem extends StatelessWidget {
  final JingXuanCellModel model;

  JingxuanItem({Key key,this.model}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.white,
      height: 120,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            margin: new EdgeInsets.only(left: 15.0,right: 15.0,top: 10.0),
            child: new Row(
              children: <Widget>[
                new Text("来自话题:",style: new TextStyle(fontSize: 13.0,color: Colors.black45)),
                Padding(
                  padding: new EdgeInsets.only(left: 5.0),
                  child: new Text(model.fromTopic ?? '',style: new TextStyle(fontSize: 13.0,color: Colors.black87)),
                )
              ],
            ),
          ),
          new Container(
            margin: new EdgeInsets.only(left: 15.0,right: 15.0),
            child: new Text(model.title ?? '',style: new TextStyle(fontSize: 15.0,color: Colors.black),maxLines: 2,softWrap: false,overflow: TextOverflow.ellipsis,),
          ),
          new Container(
            margin: new EdgeInsets.only(left: 15.0,right: 15.0),
            child: new Row(
              children: <Widget>[
                new Text(model.follow.toString() + '关注',style: new TextStyle(fontSize: 13.0,color: Colors.black45)),
                Padding(
                  padding: new EdgeInsets.only(left:15.0),
                  child: new Text(model.comment.toString() + '回答',style: new TextStyle(fontSize: 13.0,color: Colors.black45)),
                )
              ],
            ),
          ),
          new Container(
            color: new Color.fromARGB(255, 242, 242, 245),
            height: 1.0,
          ),
        ],
      ),
    );
  }
}