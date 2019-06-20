import 'package:flutter/material.dart';
import 'package:flutter_lagou/public.dart';
import 'package:flutter_lagou/widgets/home/home_public.dart';

class HomeHeadPlan extends StatelessWidget {
  final List<BannerModel> bannerDatas;
  final List<NewsBannerModel> newsDatas;
  final List<TopicTabModel> topicTabMenus;
  final List<TopicBottomModel> topicBottomDatas;

  final double height;
  final double bannerHeight;
  

  HomeHeadPlan({Key key,this.bannerDatas,this.newsDatas,this.bannerHeight,this.topicTabMenus,this.topicBottomDatas,this.height}):super(key:key);

  Widget _buildTopLine() {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        new Container(
          width: 60,
          height: 60,
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.only(left: 5.0),
            child: new Image.asset('images/home/icon_headline_entrance_36x39_@3x.png',
              width: 36.0,
              height: 39.0,
            ),
          ),
        ),
        new Container(
          width: Screen.width - 60,
          height: 60,  
          child: new ToplineBanner(newsModels: newsDatas,height: 60,width: Screen.width - 60),
        )
      ],
    );
  }

  Widget _buildMiddelBar() {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: topicTabMenus.map((model){
          return Expanded(
            flex: 1,
            child: new Container(
              child: new FadeInImage.assetNetwork(
                placeholder: globalPlaceHolderImage,
                image: model.picture ?? '',
                fit: BoxFit.cover,
              ),
            ),
          );
        }).toList(),
    );
  }

  Widget _buildTopicBottom() {
    return new Container(
      margin: new EdgeInsets.only(left: 20.0,right: 15.0),
      child: new Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Container(
            width: 145,
            height: 170,
            child: new FadeInImage.assetNetwork(
                  placeholder: globalPlaceHolderImage,
                  image: topicBottomDatas.length > 0 ? topicBottomDatas[0].left_picture: '',
                  fit: BoxFit.cover,
                ),
          ),
          new Container(
            height: 170,
            width: Screen.width - 150 - 40,
            margin: EdgeInsets.only(left: 5.0,right: 0.0),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Expanded(
                  flex: 1,
                  child: new Container(
                      height: 78,
                      child: new FadeInImage.assetNetwork(
                      placeholder: globalPlaceHolderImage,
                      image: topicBottomDatas.length > 0 ? topicBottomDatas[0].righttop_picture :'',
                      fit: BoxFit.contain,
                    ),
                  )
                ),
                new Expanded(
                  flex: 1,
                  child: new Container(
                    height: 78,
                    child: new FadeInImage.assetNetwork(
                      placeholder: globalPlaceHolderImage,
                      image: topicBottomDatas.length > 0 ? topicBottomDatas[0].rightbottom_picture :'',
                      fit: BoxFit.contain,
                    ),
                  )
                ),
              ],
            ),
          )
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return new Container(
      width: Screen.width,
      height: height,
      color: Color.fromARGB(255, 242, 242, 245),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new HomeBanner(bannerModels: bannerDatas,height: bannerHeight,placeholder:  globalPlaceHolderImage),
          new Container(
            color: Colors.white,
            width: Screen.width,
            height: 60,
            child: _buildTopLine(),
          ),
          new Container(
            margin: new EdgeInsets.only(top: 10.0),
            padding: new EdgeInsets.only(left: 15.0,right: 15.0),
            width: Screen.width,
            height: 68,
            color: Colors.white,
            child: _buildMiddelBar(),
          ),
          new Container(
            width: Screen.width,
            height: 170,
            color: Colors.white,
            child: _buildTopicBottom(),
          )
        ],
      ),
    );
  }
}