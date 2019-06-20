import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class NewsBanner extends StatefulWidget {
  final double height;
  final double width;
  final int delayTime;
  final int scrollTime;
  final bool autoPlay;
  final List<Widget> content;
  int _page = 0;

  NewsBanner({Key key,@required this.content,this.width = 240,this.height = 60,this.delayTime = 3,this.scrollTime = 500,this.autoPlay = false}):super(key:key);
  @override
  _NewsBannerState createState() => _NewsBannerState();
}

class _NewsBannerState extends State<NewsBanner> {
  PageController controller = new PageController();
  Timer timer;

 void resetTimer() {
    if (widget.autoPlay) {
      clearTimer();
      timer = new Timer.periodic(new Duration(seconds: widget.delayTime), (Timer timer) {
        
        if (controller.positions.isNotEmpty) {
          widget._page = controller.page.round() + 1;
          controller.animateToPage(widget._page,duration: new Duration(milliseconds: widget.scrollTime),curve: Curves.linear);
          setState(() {
            
          });
        }
      });
    }
  }

  void clearTimer() {
    if (timer != null) {
      timer.cancel();
      timer = null;
    }
  }

  void _onPageChanged(index) {
    setState(() {
      widget._page = index;
    });
  }

 @override
  void dispose() {
    clearTimer();

    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    resetTimer();
  }

  @override
  Widget build(BuildContext context) {
    return new SizedBox(
      height: widget.height,
      width: widget.width,
      child: new PageView.builder(
        controller: controller,
        scrollDirection: Axis.vertical,
        physics: const PageScrollPhysics(parent: const ClampingScrollPhysics()),
        itemBuilder: (BuildContext context, int index) {
          return widget.content[index % widget.content.length];
        },
        itemCount: 0x7fffffff,
        onPageChanged: _onPageChanged,
      ),
    );
  }
}