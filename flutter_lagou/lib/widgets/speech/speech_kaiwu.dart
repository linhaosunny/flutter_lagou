import 'package:flutter/material.dart';
import 'package:flutter_lagou/widgets/speech/speech_public.dart';
import 'package:flutter_lagou/public.dart';

class SpeechKaiwu extends StatefulWidget {
  @override
  _SpeechKaiwuState createState() => _SpeechKaiwuState();
}

class _SpeechKaiwuState extends State<SpeechKaiwu> {
  List<BannerModel> bannerModels = [];
  List<KaiWuCellModel> courseModels = [];
  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      var action = 'kaiwu_data';
      var responseJson = await Request.post(action: action);
      List moduleData = responseJson['module'];

      moduleData.forEach((data) {
        BaseModel.fromJson(data, "topbanner", (data) {
          bannerModels.add(BannerModel.fromJson(data));
        });

        BaseModel.fromJson(data, "coursecell", (data) {
          courseModels.add(KaiWuCellModel.fromJson(data));
        });
      });

      setState(() {
      });

    } catch (e) {
      print('读取错误：' + e.toString());
    }
    // print(Screen.navigationBarHeight);
  }


  Widget _buildMiddleBar(KaiWuCellModel model) {
    return new Container(
      height: 55,
      padding: new EdgeInsets.only(left: 20.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new Text(model.title ?? '',style: new TextStyle(color: Colors.black87, fontSize: 18.0)),
          new Container(
              margin: const EdgeInsets.only(left: 20.0),
              height: 22,
              width: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(11),
                color: Color.fromARGB(255, 15, 185, 125),
              ),
              child: new Center(
                child: new Text(model.tag ?? '',style: new TextStyle(color: Colors.white, fontSize: 13.0)),
              ),
          ),
        ],
      ),
    );
  }

  Widget _buildCourseContent(KaiWuCourseModel model) {
    return new Container(
      margin: new EdgeInsets.only(left: 15.0,right: 15.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Container(
            width: 115,
            height: 150,
            margin: new EdgeInsets.only(top: 10.0,bottom: 15.0),
            child: new FadeInImage.assetNetwork(
              placeholder: globalPlaceHolderImage,
              image: model.image ?? '',
              fit: BoxFit.contain,
            ),
          ),
          new Container(
            margin: new EdgeInsets.only(left: 15.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  constraints: new BoxConstraints(
                    maxWidth: Screen.width - 45 - 115,
                  ),
                  child: new Text(model.title,
                    style: new TextStyle(fontSize:18.0,color:Colors.black87,),
                    softWrap: false,maxLines: 2,
                    overflow: TextOverflow.ellipsis
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 5.0),
                  child: new Text(model.sub_title,style: new TextStyle(fontSize:13.0,color:Colors.black54)),
                ),
                new Text(model.presenter_name + " | " + model.presenter_title,style: new TextStyle(fontSize:11.0,color:Colors.black38)),
                new Container(
                  padding: new EdgeInsets.only(top: 40.0),
                  child: new Row (
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      new Text("￥",style:new TextStyle(fontSize:14.0,color:Colors.deepOrange)),
                      new Text(model.price.toString(),style:new TextStyle(fontSize:18.0,color:Colors.deepOrange)),
                      new Padding(
                        padding: new EdgeInsets.only(left: 10.0),
                        child: new Text("原价" + model.original_price.toString(),
                          style: new TextStyle(
                            fontSize:11.0,
                            color:Colors.black45,
                            decoration: TextDecoration.lineThrough,
                            decorationStyle:TextDecorationStyle.solid,
                            decorationColor: Colors.black54
                          )
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );  
  }

  Widget _buildCourseItemList() {
    return new Container(

    );
  }

  Widget _buildCourseCell(KaiWuCellModel model) {
    return new Container(
      color: Colors.white,
      child: new Column(
        children: <Widget>[
          _buildMiddleBar(model),
          new Container(
            margin: new EdgeInsets.only(left: 15.0,right: 15.0),
            color: new Color.fromARGB(255, 242, 242, 245),
            height: 1.0,
          ),
          _buildCourseContent(model.course_model)
        ],
      ),
    );
  }

  Widget _buildCourseList() {
    return  new Column(
      children: courseModels.map((KaiWuCellModel model) {
        return _buildCourseCell(model);
      }).toList(),
    );
  }

  Widget _buildKaiwuBottom() {
    return new Container(
      color: Colors.white,
      height: 160,
      width: Screen.width,
      margin: new EdgeInsets.only(top: 10.0),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Container(
            child: new Image.asset(
              'images/speech/community_EnlightenmentNone_78x78_@3x.png',
              width: 70.0,
              height: 70.0,
            ),
          ),
          new Container(
            child: new Text("敬请期待更多精彩内容",style: new TextStyle(fontSize: 14.0,color: Colors.black45),),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        new SliverToBoxAdapter(
          child: new Column(
            children: <Widget>[
              KaiwuBanner(bannerModels: bannerModels,height: 200,placeholder:'',),
              _buildCourseList(),
              _buildKaiwuBottom()
            ],
          ),
        ),
      ],
    );
  }
}