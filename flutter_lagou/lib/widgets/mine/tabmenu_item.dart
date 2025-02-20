import 'package:flutter/material.dart';

class TabmenuItem extends StatefulWidget {
  final String iconStr;
  final String title;
  final VoidCallback onPressed;

  TabmenuItem(this.iconStr,this.title,{Key? key,required this.onPressed}) : super(key:key);
  
  @override
  _TabmenuItemState createState() => _TabmenuItemState();
}

class _TabmenuItemState extends State<TabmenuItem> {
  
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: widget.onPressed,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          new Container(
            child: new Image.asset(
              widget.iconStr,
              width: 32.0,
              height: 32.0,
            ),
          ),
          new Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: new Text(
              widget.title,
              style: new TextStyle(color: Colors.black54, fontSize: 13.0)
            ),
          )
        ],
      ),
    );
  }
}