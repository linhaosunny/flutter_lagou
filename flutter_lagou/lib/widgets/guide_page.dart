import 'package:flutter/material.dart';
import 'package:flutter_lagou/common/skip_down_time.dart';
import 'package:flutter_lagou/page_routes.dart';

class GuidePage extends StatefulWidget {
  @override
  _GuidePageState createState() => _GuidePageState();
}

class _GuidePageState extends State<GuidePage> implements OnSkipClickLister {

  var welcomeImageUrl = '';

  void _delayedGoHomePage() {
    Future.delayed(new Duration(seconds: 5), () {
      _goHomePage();
    });
  }

  void _goHomePage() {
    Navigator.of(context).pushNamedAndRemoveUntil(PageRoutes.NEWFEATURE_PAGE, (Route<dynamic> route) => false);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _delayedGoHomePage();
  }

  @override
  void onSkipClick() {
    // TODO: implement onSkipClick
    _goHomePage();
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        new Container(
          color: Colors.white,
          child: new Image.asset(
            'images/guide/qidongye_1242x2208_@1x.png',
            fit: BoxFit.cover,
          ),
          constraints: new BoxConstraints.expand(),
        ),
        new Container(
          child: Align(
            alignment: Alignment.topRight,
            child: new Container(
              padding: const EdgeInsets.only(
                top: 60.0,
                right: 30.0,
              ),
              child: new SkipdownTime(
                Color.fromARGB(255, 15, 185, 125),
                22.0,
                new Duration(seconds: 3),
                new Size(25.0, 25.0),
                skipText: '跳过',
                clickLister: this,
                isHidden: true,
              ),
            ),
          ),
        )
      ],
    );
  }
}