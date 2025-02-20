import 'package:flutter/material.dart';

class Stars extends StatefulWidget {
  final double score;
  final double size;
  Stars({Key? key,this.score = 3.0,this.size = 16}):super(key:key);

  @override
  _StarsState createState() => _StarsState();
}

class _StarsState extends State<Stars> {
  List<StarsModel> stars = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    for (var i = 0; i < 5; i++) {
      StarsModel model = StarsModel();
      if ( (i + 1) < widget.score) {
        model.isStart = true;
      } else {
        model.isStart = false;
      }
      stars.add(model);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Row(
        children: stars.map((star){
          return star.isStart ? new Icon(Icons.star,color: Colors.yellow,size:widget.size) :
          new Icon(Icons.star,color: Colors.grey,size:widget.size);
        }).toList(),
      ),
    );
  }
}

class StarsModel {
  bool isStart = false;
}