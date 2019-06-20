import 'package:flutter/material.dart';

class CollectionButton extends StatefulWidget {
  final Color themeColor;
  final String title;
  final Function(bool) onValueChanged;

  CollectionButton({Key key,this.themeColor = Colors.black,@required this.title,this.onValueChanged}):super(key:key);
  @override
  _CollectionButtonState createState() => _CollectionButtonState();
}

class _CollectionButtonState extends State<CollectionButton> {
  bool isTap = false;

  @override
  Widget build(BuildContext context) {
    return new InkWell(
      onTap: () {
        isTap = !isTap;
        if (widget.onValueChanged !=null) {
          widget.onValueChanged(isTap);
        }
        setState(() {
          
        });
      },
      child:  new Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          color: isTap ? widget.themeColor.withOpacity(0.08) : Colors.transparent,
          border: Border.all(width: 1.0,color:isTap ? widget.themeColor: new Color.fromARGB(255, 242, 242, 245))
        ),
        child: new Center(
          child: new Text(widget.title, softWrap: false,overflow: TextOverflow.ellipsis,maxLines: 1,style: new TextStyle(
            color: isTap ? widget.themeColor: Colors.black87
          ),),
        ),
      ),
    );
  }
}