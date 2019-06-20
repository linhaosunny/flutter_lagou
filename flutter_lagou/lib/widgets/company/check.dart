import 'package:flutter/material.dart';

class CustomCheck extends StatefulWidget {
  final String normalIcon;
  final String checkIcon;
  final double size;
  final Function(bool) onValueChanged;
  CustomCheck({Key key,@required this.normalIcon,@required this.checkIcon,this.size = 16,this.onValueChanged}):super(key:key);

  @override
  _CustomCheckState createState() => _CustomCheckState();
}

class _CustomCheckState extends State<CustomCheck> {
  bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size,
      height: widget.size,
      child: InkWell(
        onTap: () {
          isCheck = !isCheck;
          if (widget.onValueChanged != null) {
            widget.onValueChanged(isCheck);
          }
          setState(() {
            
          });
        },
        child: new Container(
          child: Image.asset(isCheck ? widget.checkIcon : widget.normalIcon,fit: BoxFit.fitWidth,),
        ),
      ),
    );
  }
}