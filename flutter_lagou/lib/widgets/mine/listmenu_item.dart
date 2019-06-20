import 'package:flutter/material.dart';
import 'package:flutter_lagou/widgets/mine/visible_widget.dart';

class ListMenuItem extends StatefulWidget {
  final String icon;
  final String title;
  String iconNews;
  bool newsVisible;
  final String subTitle;
  final VoidCallback onPressed;

  ListMenuItem(this.icon,this.title,this.iconNews,this.subTitle,this.newsVisible,{Key key,this.onPressed}) : super(key: key);

  @override
  _ListMenuItemState createState() => _ListMenuItemState();
}

class _ListMenuItemState extends State<ListMenuItem> {

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: widget.onPressed,
      child: new Column(
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.only(
              left: 15.0,
              top: 20.0,
              right: 20.0,
              bottom: 15.0
            ),
            child: new Row(
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.only(
                    right: 10.0,
                  ),
                  child: new Container(
                    child: new Image.asset(
                      widget.icon,
                      width: 23.0,
                      height: 23.0,
                    ),
                  ),
                ),
                new Expanded(
                  child: 
                  new Row(
                    children: <Widget>[
                      new Text(
                        widget.title,
                        style:new TextStyle(color: Colors.black87,fontSize: 16.0)
                      ),
                      new VisibleWidget(new Container(
                        padding: EdgeInsets.only(left: 15.0),
                        child: new Image.asset(
                          widget.iconNews,
                          width: 32.0,
                          height: 15.0,
                        ),
                      ),visible: widget.newsVisible),
                    ],
                  )
                ),
                new Container(
                  child: new Text(
                    widget.subTitle,
                    style:new TextStyle(color: Colors.black54,fontSize: 12.0)
                  ),
                ),
                new Icon(Icons.chevron_right,color: Colors.grey,size: 16.0,)
              ],
            ),
          ),
          new Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              right: 20.0,
            ),
            child: new Divider(),
          )
        ],
      ),
    );
  }
}

