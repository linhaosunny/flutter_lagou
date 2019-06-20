import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math' as math;


class _DrawProgress extends CustomPainter {
  final Color color;
  final double radius;
  double angle;
  AnimationController animation;

  Paint circleFillPaint;
  Paint progressPaint;
  Rect rect;

  _DrawProgress(
    this.color,
    this.radius,
    {
      double this.angle, AnimationController this.animation
    }) {
      circleFillPaint = new Paint();
      circleFillPaint.color = Colors.white;
      circleFillPaint.style = PaintingStyle.fill;

      progressPaint = new Paint();
      progressPaint.color = color;
      progressPaint.style = PaintingStyle.stroke;
      progressPaint.strokeCap = StrokeCap.round;
      progressPaint.strokeWidth = 3.0;

      if (animation != null && !animation.isAnimating) {
        animation.forward();
      }

    }

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint

    double x = size.width / 2;
    double y = size.height / 2;
    Offset center = new Offset(x, y);
    canvas.drawCircle(center, radius - 2, circleFillPaint);
    var center2 = center;
    rect = Rect.fromCircle(center: center,radius: radius);
    angle = angle * (-1);
    double startAngle = -math.pi / 2;
    double sweepAngle = math.pi * angle / 180;

    Path path = new Path();
    path.arcTo(rect, startAngle, sweepAngle, true);
    canvas.drawPath(path, progressPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return oldDelegate != this;
  }
}

class SkipdownTime extends StatefulWidget {
  final Color color;
  final double radius;
  final Duration duration;
  final bool isHidden;
  final Size size;
  String skipText;
  OnSkipClickLister clickLister;

  SkipdownTime(
    this.color,
    this.radius,
    this.duration,
    this.size,
    {
      Key key,
      String this.skipText = '跳过',
      OnSkipClickLister this.clickLister,
      this.isHidden = false,
    }) : super(key: key);

  @override
  __SkipdownTimeState createState() => __SkipdownTimeState();
}

class __SkipdownTimeState extends State<SkipdownTime> with TickerProviderStateMixin {
  AnimationController animationController;
  double curAngle = 360.0;

  void _onSkipClick() {
    if (widget.clickLister != null) {
      widget.clickLister.onSkipClick();
    }
  }

  void _doAnimation() async {
    Future.delayed(new Duration(milliseconds: 50), () {
      if (mounted) {
        animationController.forward().orCancel;
      } else {
        _doAnimation();
      }
    });
  }

  void _change() {
    double ange = double.parse(((animationController.value * 360) ~/ 1).toString());
    setState(() {
      curAngle = (360.0 - ange);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = new AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    animationController.addListener(_change);
    _doAnimation();
  }

  @override
  void didUpdateWidget(SkipdownTime oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.isHidden ? new Container() : new GestureDetector(
      onTap: _onSkipClick,
      child:  new Stack(
        alignment: Alignment.center,
        children: <Widget>[
          new CustomPaint(
            painter: new _DrawProgress(widget.color, widget.radius,angle: curAngle),
            size: widget.size,
          ),
          Text(
            widget.skipText,
            style: new TextStyle(
              color: widget.color,
              fontSize: 13.5,
              decoration: TextDecoration.none
            ),
          )
        ],
      ),
    );
  }
}

abstract class OnSkipClickLister {
  void onSkipClick();
}