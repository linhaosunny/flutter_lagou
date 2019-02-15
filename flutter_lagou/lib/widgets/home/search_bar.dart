import 'package:flutter/material.dart';


class SearchBar extends StatefulWidget {
  final String leftIcon;
  Color  backgroudColor;

  SearchBar(this.leftIcon,{Key key,this.backgroudColor}): super(key: key);
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: widget.backgroudColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Image.asset(widget.leftIcon,
          width: 20,
          height: 20,
          color: Colors.black54),
          new Container(
            padding: new EdgeInsets.only(left: 15.0),
            child: new Text('移动开发',
              style: new TextStyle(fontSize: 14.0,color: Colors.black54),
            ),
          )
        ],
      ),
    );
  }
}