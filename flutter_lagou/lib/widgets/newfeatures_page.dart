import 'package:flutter/material.dart';
import 'package:flutter_lagou/public.dart';
import 'package:flutter_lagou/widgets/banner/indicator.dart';
import 'package:flutter_lagou/common/custom_button.dart';
import 'package:flutter_lagou/page_routes.dart';

class NewFeaturesPage extends StatefulWidget {
   final Color themeColor;

   NewFeaturesPage({Key key,this.themeColor}):super(key:key);
  @override
  _NewFeaturesPageState createState() => _NewFeaturesPageState();
}

class _NewFeaturesPageState extends State<NewFeaturesPage> {

  PageController controller = new PageController();
  int page = 0;
  List<String> newfeatureUrls = [];

  void _onPageChanged(index) {
    setState(() {
      page = index;
    });
  }

  void _delayedGoHomePage() {
      _goHomePage();
  }

  void _goHomePage() {
    Navigator.of(context).pushNamedAndRemoveUntil(PageRoutes.HOME_PAGE, (Route<dynamic> route) => false);
  }

  Widget _buildNewFeatureContent(String url, bool isLast) {
    bool isNetworkUrl = url.contains('https') || url.contains('http');

    if (isLast) {
      return new Container(
        color: Colors.white,
        child: isNetworkUrl ?  new Image.network(url,
          fit: BoxFit.cover,
        ): new Image.asset(
          url,
          fit: BoxFit.cover,
        ),
        constraints: new BoxConstraints.expand(),
      );
    }
    
    return new Container(
      color: Colors.white,
      child: isNetworkUrl ?  new Image.network(url,
        fit: BoxFit.cover,
      ): new Image.asset(
        url,
        fit: BoxFit.cover,
      ),
      constraints: new BoxConstraints.expand(),
    );
  }
   Widget _buildIndicator() {
    return new Indicator(
      size: newfeatureUrls.length,
      currentIndex: page % newfeatureUrls.length,
      paddingBottom: kToolbarHeight,
      type: IndicatorType.rectangle,
      indicatorMargin: 8.0,
    );
  }

  Widget _buildEnterButton() {
    return page == (newfeatureUrls.length - 1) ? new Container(
      margin: EdgeInsets.only(bottom: kToolbarHeight + 60),
      child: CustomButton(
        width: 120,
        height: 40,
        title: "下一步",
        backgroudColor: widget.themeColor,
        borderRadius: 40.0 * 0.5,
        backgroudImage: 'images/welcome/who_see_me_float_113x48_@3x.png',
        titleStyle: new TextStyle(fontSize: 16.0,color: Colors.white,decoration: TextDecoration.none),
        onButtonClick: _delayedGoHomePage,
      ),
    ) : new Container();
  }

  Widget _buildContent(List<Widget> content) {
    return SizedBox(
      width: Screen.width,
      height: Screen.height,
      child: new PageView.builder(
        controller: controller,
        physics: const PageScrollPhysics(parent: const ClampingScrollPhysics()),
        itemBuilder: (BuildContext context, int index) {
          return content[index];
        },
        itemCount: content.length,
        onPageChanged: _onPageChanged,
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (newfeatureUrls.length == 0) {
      List<String> defaultNewFeatures = [
        'images/newfeature/welcome_216_1_1125x2436_@1x.png',
        'images/newfeature/welcome_216_2_1125x2436_@1x.png',
        'images/newfeature/welcome_216_3_1125x2436_@1x.png'
      ];

      newfeatureUrls.addAll(defaultNewFeatures);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          bottom: 0,
          child: new Container(
            color: Colors.white,
            child: newfeatureUrls !=null ? _buildContent(newfeatureUrls.map((url) {
                return _buildNewFeatureContent(url, url == newfeatureUrls.last);
              }
            ).toList()) :new Container(),
          ),
        ),
        _buildEnterButton(),
        _buildIndicator()
      ],
    );
  }
}