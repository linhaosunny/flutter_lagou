import 'package:flutter/material.dart';


class FSearchBar extends StatefulWidget {
  final String leftIcon;
  Color?  backgroudColor;
  double height;

  FSearchBar(this.leftIcon,{Key? key, this.backgroudColor,required this.height}): super(key: key);
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<FSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.height * 0.5),
        color: widget.backgroudColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Image.asset(widget.leftIcon,
          width: 14,
          height: 14,
          color: Colors.black45),
          new Container(
            padding: new EdgeInsets.only(left: 5.0),
            child: new Text('移动开发',
              style: new TextStyle(fontSize: 12.0,color: Colors.black45),
            ),
          )
        ],
      ),
    );
  }
}