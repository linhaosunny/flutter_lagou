import 'package:flutter/material.dart';
import 'package:flutter_lagou/widgets/message/message_public.dart';
import 'package:flutter_lagou/public.dart';

class ContactItem extends StatefulWidget {
  final double height;
  final Color themeColor;
  final ChatModel model;

  ContactItem({Key key,this.model,this.height = 80,this.themeColor}):super(key:key);
  @override
  _ContactItemState createState() => _ContactItemState();
}

class _ContactItemState extends State<ContactItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Screen.width,
      height: widget.height,
      child: new Row(
        children: <Widget>[
          new Container(
            margin: EdgeInsets.only(left: 15.0,right: 15.0),
            child: (widget.model.image !=null && widget.model.image != '') ? new CircleAvatar(
              radius: 25.0,
              backgroundImage: new NetworkImage(widget.model.image ?? ''),
            ) : new Container(
              width: 50.0,
              height: 50.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: widget.themeColor.withOpacity(0.1),
                border: Border.all(color: widget.themeColor,width: 1.0),
              ),
              child: new Center(
                child: new Text(widget.model.hrName.replaceRange(1, widget.model.hrName.length, ''),style: new TextStyle(fontSize: 20.0,color: widget.themeColor), ),
              ),
            ),
          ),
          new Container(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Expanded(
                  child: new Container(
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
                                width: Screen.width - 180,
                                child: new Text(widget.model.hrName + '@' + widget.model.companyName,
                                  style: new TextStyle(fontSize: 15.0,color: Colors.black,fontWeight: FontWeight.w400),
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: false,
                                  maxLines: 1,
                                ),
                              ),
                              new Container(
                                width: Screen.width - 180,
                                padding: EdgeInsets.only(top: 5.0),
                                child: new Text(widget.model.lastSay,
                                  style: new TextStyle(fontSize: 12.0,color: Colors.black45),
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: false,
                                  maxLines: 1,
                                ),
                              )
                            ],
                          ),
                        ),
                        new Container(
                          margin: EdgeInsets.only(top: 20.0,left: 10.0),
                          child: new Text(widget.model.dateString,style: new TextStyle(fontSize: 12.0,color: Colors.black45)),
                        )
                      ],
                    ),
                  ),
                ),
                new Container(
                  margin: EdgeInsets.only(left: 10.0),
                  color: Colors.black12,
                  height: 0.5,
                  width: Screen.width - 100,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}