import 'package:flutter/material.dart';
import 'package:flutter_lagou/widgets/home/home_public.dart';
import 'package:flutter_lagou/public.dart';

class ToplineBanner extends StatelessWidget {
  final List<NewsBannerModel> newsModels;
  final double height;
  final double width; 
  
  ToplineBanner({Key? key,required this.newsModels,required this.height,required this.width}):super(key:key);

  Widget _buildToplineItem({required String keyword,required String title}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        new Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3.0),
            border: Border.all(color: Color.fromARGB(255, 15, 185, 125),width: 0.6)
          ),
          child: new Padding(
            padding: new EdgeInsets.only(left: 5.0,right: 5.0),
            child: new Text(keyword,style:new TextStyle(fontSize: 11.0,color: Color.fromARGB(255, 15, 185, 125))),
          )
        ),
        
        new Container(
          width: width - 70,
          margin: new EdgeInsets.only(left: 10.0,right: 5.0),
          child: new Text(title,
            overflow: TextOverflow.clip,
            softWrap: false,
            style:new TextStyle(
              fontSize: 14.0,
              color: Colors.black87
            ),
          ),
        )
      ],
    );
  }

  Widget _buildToplineContent({required NewsBannerModel model}) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(bottom: 1.0),
          child: _buildToplineItem(keyword: model.keywordTop,title: model.titleTop),
        ),
        Padding(
          padding: EdgeInsets.only(top: 1.0),
          child: _buildToplineItem(keyword: model.keywordBottom,title: model.titleBottom),
          )
        
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    if (newsModels == null || newsModels.length == 0) {
      return SizedBox();
    }

    return Container(
      alignment: Alignment.center,
      height: height,
      child: new NewsBanner(
        height: height,
        width: width,
        autoPlay: true,
        content: newsModels.map((model){
          return Container(
            margin: new EdgeInsets.symmetric(horizontal: 10.0),
            child: _buildToplineContent(model: model),
          );
        }).toList(),
      )
    );
  }
}