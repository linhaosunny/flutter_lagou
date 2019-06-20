import 'package:flutter/material.dart';
import 'package:flutter_lagou/widgets/speech/speech_public.dart';
import 'package:flutter_lagou/public.dart';

class ZhuanlanItem extends StatelessWidget {
  final ZhunlanCellModel model;

  ZhuanlanItem({Key key,this.model}) :super(key:key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: Screen.width,
      color: Colors.white,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Container(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Container(
                  height: 90,
                  margin: new EdgeInsets.only(left: 15.0),
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Container(
                        width: Screen.width - 50 - 120,
                        child: new Text(model.title,style:new TextStyle(fontSize: 15.0,color:Colors.black),softWrap: false,overflow: TextOverflow.ellipsis,maxLines: 2,),
                      ),
                      new Text(model.keyword,style:new TextStyle(fontSize: 13.0,color:Colors.black45))
                    ],
                  ),
                ),
                new Container(
                  width: 120,
                  height: 90,
                  margin: EdgeInsets.only(right: 15.0),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(model.image ?? ''),
                      fit: BoxFit.cover
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                  ),
                )
              ],
            ),
          ),
          new Container(
            margin: new EdgeInsets.only(top: 20.0),
            color: new Color.fromARGB(255, 242, 242, 245),
            height: 1.0,
          )
        ],
      )
    );
  }
}