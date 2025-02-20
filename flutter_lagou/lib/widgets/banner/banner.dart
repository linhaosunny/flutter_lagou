import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lagou/widgets/banner/indicator.dart';

class BannerWidget extends StatefulWidget {
  final double height;
  final int delayTime;
  final int scrollTime;
  final bool autoPlay;
  final bool showIndicator;
  final List<Widget> content;
  int _page = 0;

  BannerWidget({Key? key,required this.content,this.height = 220,this.delayTime = 3,this.scrollTime = 500,this.autoPlay = false,this.showIndicator = true}):super(key:key);
  @override
  _BannerWidgetState createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  PageController controller = new PageController();
  Timer? timer;

  void resetTimer() {
    if (widget.autoPlay) {
      clearTimer();
      timer = new Timer.periodic(new Duration(seconds: widget.delayTime), (Timer timer) {
        
        if (controller.positions.isNotEmpty) {
          widget._page = (controller.page?.round() ?? 0) + 1;
          controller.animateToPage(widget._page,duration: new Duration(milliseconds: widget.scrollTime),curve: Curves.linear);
          setState(() {
            
          });
        }
      });
    }
  }

  void clearTimer() {
    if (timer != null) {
      timer!.cancel();
      timer = null;
    }
  }

  void _tapBannerDown(details) {
    clearTimer();
  }

  void _tapBannerUp(details) {
    _tapBannerCancel();
  }

  void _tapBannerCancel() {
    resetTimer();
  }

  void _onPageChanged(index) {
    setState(() {
      widget._page = index;
    });
  }

  Widget _buildBanner() {
    return new SizedBox(
      width: MediaQuery.of(context).size.width,
      height: widget.height,
      child: new GestureDetector(
        onTapDown: _tapBannerDown,
        onTapUp: _tapBannerUp,
        onTapCancel: _tapBannerCancel,
        child: new PageView.builder(
          controller: controller,
          physics: const PageScrollPhysics(parent: const ClampingScrollPhysics()),
          itemBuilder: (BuildContext context, int index) {
            return widget.content[index % widget.content.length];
          },
          itemCount: 0x7fffffff,
          onPageChanged: _onPageChanged,
        ),
      ),
    );
  }

  Widget _buildIndicator() {
    return new Indicator(
      show: widget.showIndicator,
      size: widget.content.length,
      currentIndex:  widget._page % widget.content.length,
    );
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
    return new Stack(
      children: <Widget>[
        _buildBanner(),
        _buildIndicator()
      ],
    );
  }
}