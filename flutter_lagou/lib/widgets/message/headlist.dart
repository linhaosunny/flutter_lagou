import 'package:flutter/material.dart';

class Headlist extends StatefulWidget {
  final List<String> items;
  final double height; 
  Headlist({Key key,this.items,this.height = 20}) :super(key:key);
  @override
  _HeadlistState createState() => _HeadlistState();
}

class _HeadlistState extends State<Headlist> {
  Widget _buildItem(String url) {
    return new Container(
      width: widget.height,
      height: widget.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(url ?? ''),
          fit: BoxFit.fitHeight
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(widget.height * 0.5),
        ),
        border: Border.all(color: Colors.white,width: 2.0)
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    
    return (widget.items != null && widget.items.length > 0) ? new Stack(
      children: widget.items.reversed.map((url) {
        int index = widget.items.indexOf(url);
        return Padding(
          padding: EdgeInsets.only(left: (widget.height - 5.0) * index),
          child: _buildItem(url),
        );
      }).toList(),
    ) :new Container();
  }
}