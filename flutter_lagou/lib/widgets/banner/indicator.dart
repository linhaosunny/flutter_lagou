import 'package:flutter/material.dart';

enum IndicatorType {
  circle,
  rectangle,
}

class Indicator extends StatelessWidget {
  final Widget indicatorNormal;
  final Widget indicatorSelected;
  final double indicatorMargin;
  final bool show;
  final bool showBackgroud;
  final int size;
  final int currentIndex;
  final double paddingBottom;
  final IndicatorType type;

  Indicator({Key key,this.size,this.currentIndex,this.show = true,this.showBackgroud =false, this.indicatorNormal,this.indicatorSelected,this.indicatorMargin = 5.0,this.paddingBottom = 10, this.type =IndicatorType.circle}): super(key:key);
  

  Widget _buildCircleIndicatorDot({bool selected = false,double indicatorDotSize = 6.0}) {
    if (selected) {
      return new Container(
        width: indicatorDotSize*2,
        height: indicatorDotSize,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
          color: showBackgroud ? Colors.yellow : Colors.white,
        ),
      );
    } else {
      return new Container(
        width: indicatorDotSize,
        height: indicatorDotSize,
        decoration: new BoxDecoration(
          shape: BoxShape.circle,
          color: showBackgroud ? Colors.yellow : Colors.white,
        ),
      );
    }
  }

Widget _buildRectangleIndicatorDot({bool selected = false,double indicatorDotSize = 6.0}) {
    if (selected) {
      return new Container(
        width: indicatorDotSize*2,
        height: indicatorDotSize,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(indicatorDotSize * 0.5),
          color: Colors.black54,
        ),
      );
    } else {
      return new Container(
        width: indicatorDotSize*2,
        height: indicatorDotSize,
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.circular(indicatorDotSize * 0.5),
          color: Colors.black26,
        ),
      );
    }
  }

  Widget _buildGenerateIndicatorDot({bool selected = false,double indicatorDotSize = 6.0}) {
    switch (type) {
        case IndicatorType.circle:
          return _buildCircleIndicatorDot(selected: selected,indicatorDotSize: indicatorDotSize);
        case IndicatorType.rectangle:
          return _buildRectangleIndicatorDot(selected: selected,indicatorDotSize: indicatorDotSize);
      }
  }

  List<Widget> _buildIndicatorDot() {
    List<Widget> indicators = [];
    final int len = this.size;
    Widget selected = this.indicatorSelected ?? _buildGenerateIndicatorDot(selected: true);
    Widget normal = this.indicatorNormal ?? _buildGenerateIndicatorDot(selected: false);

    for (var index = 0; index < len; index++) {
      indicators.add(index == this.currentIndex ? selected: normal);
      if (index != len - 1) {
        indicators.add(new SizedBox(width:this.indicatorMargin));
      }
    }

    return indicators;
  }

  Widget _buildIndicator(BuildContext context) {
    Widget smallContainer = new Container(
      child: new Row(
        mainAxisSize: MainAxisSize.min,
        children: _buildIndicatorDot(),
      ),
    );

    return new Align(
      alignment: Alignment.bottomCenter,
      child: new Opacity(
        opacity: show ? 1.0 : 0.0,
        child: new Container(
          height: 25,
          margin: new EdgeInsets.only(bottom: paddingBottom),
          color: Colors.white.withOpacity(showBackgroud ? 0.4:0.0),
          alignment: Alignment.center,
          child: smallContainer,
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return _buildIndicator(context);
  }
}