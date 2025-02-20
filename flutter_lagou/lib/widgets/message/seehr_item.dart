import 'package:flutter/material.dart';
import 'package:flutter_lagou/widgets/message/message_public.dart';
import 'package:flutter_lagou/public.dart';
import 'package:common_utils/common_utils.dart';
import 'package:intl/intl.dart';

class SeeHRItem extends StatefulWidget {
  final SeeHRModel model;

  SeeHRItem({Key? key,required this.model}):super(key:key);
  @override
  _SeeHRItemState createState() => _SeeHRItemState();
}

class _SeeHRItemState extends State<SeeHRItem> {

  double _getWidgetHeight() {
    return widget.model.matchJob != null ? 190 : 80; 
  }

  Widget _buildNormalContent() {
    return new Row(
        children: <Widget>[
          new Container(
            margin: EdgeInsets.only(left: 15.0,right: 15.0),
            child: new CircleAvatar(
              radius: 25.0,
              backgroundImage: new NetworkImage(widget.model.hrImage ?? ''),
            ),
          ),
          new Container(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Container(
                        width: Screen.width - 240,
                        child: new Text(widget.model.hrName,
                          style: new TextStyle(fontSize: 18.0,color: Colors.black,fontWeight: FontWeight.w400),
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                          maxLines: 1,
                        ),
                      ),
                      new Container(
                        width: Screen.width - 240,
                        padding: EdgeInsets.only(top: 5.0),
                        child: new Text(widget.model.hrJob + ' ' + widget.model.companyName,
                          style: new TextStyle(fontSize: 14.0,color: Colors.black54),
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                          maxLines: 1,
                        ),
                      )
                    ],
                  ),
                ),
                new Container(
                  margin: EdgeInsets.only(top: 20.0,left: 20.0),
                  child: new Text(DateFormat('yyyy年MM月dd日').format(DateTime.fromMillisecondsSinceEpoch(widget.model.timestamp)) + " 查看了您",
  style: new TextStyle(fontSize: 12.0, color: Colors.black38),),
                )
              ],
            ),
          ),
        ],
      );
  }

  Widget _buildMatchJob() {
    return widget.model.matchJob != null ? new Container(
      child: new Stack(
        children: <Widget>[
          new Container(
            margin: EdgeInsets.only(left: 70),
            width: Screen.width - 85,
            height: 110.0,
            child:  new Image.asset('images/message/viewed_me_border_303x110_@3x.png',
              fit: BoxFit.fill
            )
          ),
          new Container(
            margin: EdgeInsets.only(left: 85,right: 15.0),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  margin: EdgeInsets.only(top: 13.0),
                  child: new Text('邀请投递: ' + widget.model.matchJob.jobDescribtion,
                    style:  new TextStyle(fontSize: 12.0,color: Colors.black45,),
                    maxLines: 1,
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                new Container(
                  margin: EdgeInsets.only(top: 15.0,right: 10.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Container(
                        child: new Text(widget.model.matchJob.jobName,
                        style:  new TextStyle(fontSize: 17.0,color: Colors.black54)
                        ),
                      ),
                      new Container(
                        child: new Text(widget.model.matchJob.jobSalary,
                        style:  new TextStyle(fontSize: 15.0,color: Colors.black54)
                        ),
                      )
                    ],
                  ),
                ),
                new Container(
                  margin: EdgeInsets.only(top: 5.0),
                  child: new Text(widget.model.matchJob.jobCity + '/' + widget.model.matchJob.jobWorkYear + '/' + widget.model.matchJob.jobEducation,
                    style:  new TextStyle(fontSize: 13.0,color: Colors.black54),
                  ),
                ),

              ],
            ),
          )
        ],
      ),
    ) : new Container();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Screen.width,
      height: _getWidgetHeight(),
      child: new Column(
        children: <Widget>[
          new Container(
            height: 80,
            child: _buildNormalContent(),
          ),
          new Container(
            child: _buildMatchJob(),
          )
        ],
      ),
    );
  }
}