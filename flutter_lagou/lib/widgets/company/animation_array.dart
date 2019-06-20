import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimationArray extends StatefulWidget {
  final Widget container;
  final bool isReverse;
  final bool isForward;
  AnimationArray({Key key,this.container,this.isReverse =false ,this.isForward =false}) : super(key:key);


  @override
  _AnimationArrayState createState() => _AnimationArrayState();
}

class _AnimationArrayState extends State<AnimationArray> with TickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = new AnimationController(duration: const Duration(milliseconds: 200),vsync: this);
    animation = new Tween(begin: 0.0,end: 0.5).animate(controller);
    
  }

  @override
  Widget build(BuildContext context) {
    
    if (widget.isReverse) {
      controller.reverse();
    } 

    if (widget.isForward) {
      controller.forward();
    }

    return Container(
      child: new Center(
          child: new RotationTransition(
          turns: animation,
          child: widget.container,
        ),
      ),
    );
  }
} 