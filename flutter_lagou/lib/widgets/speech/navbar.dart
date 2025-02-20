import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  final String leftIcon;
  final String titleIcon;
  final String rightIcon;
  final VoidCallback onPressedLeftItem;

  NavBar(this.leftIcon,this.titleIcon,this.rightIcon,{Key? key,required this.onPressedLeftItem}): super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {

  void _onPressedLeftItem() {

  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        new Container(
          padding: EdgeInsets.only(
            top: 60,
            left: 15
          ),
          child: IconButton(
            icon: Image.asset(widget.leftIcon,
              width: 25,
              height: 25,
            ),
            onPressed: _onPressedLeftItem,
          ),
        ),
        new Expanded(
          flex: 1,
          child: new Container(
            padding: EdgeInsets.only(
              top: 60,
            ),
            child: Image.asset(widget.titleIcon,
              width: 60,
              height: 30,
            ),
          ),
        ),
        new Container(
          padding: EdgeInsets.only(
            top: 60,
            right: 15
          ),
          child: IconButton(
            icon: Image.asset(widget.rightIcon,
              width: 25,
              height: 25,
            ),
            onPressed: _onPressedLeftItem,
          ),
        ),
      ],
    );
  }
}