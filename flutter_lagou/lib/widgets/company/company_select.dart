import 'package:flutter/material.dart';
import 'package:flutter_lagou/widgets/company/company_public.dart';
import 'package:flutter_lagou/public.dart';

class CompanySelect extends StatefulWidget {
  final double height;
  final Color themeColor;
  final Function onSureButtonClick;

  CompanySelect({Key? key,required this.height,required this.themeColor,required this.onSureButtonClick}) :super(key:key);
  @override
  _CompanySelectState createState() => _CompanySelectState();
}

class _CompanySelectState extends State<CompanySelect> {
 CompanyTypesModel typesModel = CompanyTypesModel();

 Future<void> fetchData() async {
    try {
      var action = 'company_types';
      var responseJson = await Request.post(action: action);

      typesModel = CompanyTypesModel.fromJson(responseJson);

      setState(() {
      });

    } catch (e) {
      print('读取错误：' + e.toString());
    }

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    fetchData();
  }

  Widget _buildSelectItem(List<String> items) {
    return GridView.count(
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      mainAxisSpacing: 15.0,
      crossAxisSpacing: 15.0,
      childAspectRatio: 6/2,
      children: items.map((name) {
        return CollectionButton(
          title: name,
          themeColor: widget.themeColor,
          onValueChanged: (isSelect) {
            
          },
        );
      }).toList(),
    );
  }

  Widget _buildContent(double contentHeight) {
    final double width = (Screen.width - 15.0 * 4) / 3;
    final double height = width / 3 + 15.0;
    final financingHeight = (typesModel.financing.length % 3 == 0) ? height * (typesModel.financing.length / 3).toInt() : height * (typesModel.financing.length / 3 + 1).toInt();
    final scaleHeight =  (typesModel.scale.length % 3 == 0) ? height * (typesModel.scale.length / 3) : height * (typesModel.scale.length / 3 + 1);
    final industryHeight = (typesModel.industry.length % 3 == 0) ? height * (typesModel.industry.length / 3).toInt() : height * (typesModel.industry.length / 3 + 1).toInt();
  
    return new Container(
      height: contentHeight,
      child: new ListView(
        children: <Widget>[
          new Container(
            margin: EdgeInsets.only(top: 15.0,left: 15.0,right: 15.0),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text("融资情况",style: new TextStyle(fontSize: 16.0,color: Colors.black)),
                new Container(
                  margin: EdgeInsets.only(top: 15.0),
                  height: financingHeight,
                  child:_buildSelectItem(typesModel.financing),
                )
              ],
            )
          ),
          new Container(
            margin: EdgeInsets.only(left: 15.0,right: 15.0),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text("公司规模",style: new TextStyle(fontSize: 16.0,color: Colors.black)),
                new Container(
                  margin: EdgeInsets.only(top: 15.0),
                  height: scaleHeight,
                  child:_buildSelectItem(typesModel.scale),
                )
              ],
            )
          ),
          new Container(
            margin: EdgeInsets.only(left: 15.0,right: 15.0),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text("选择行业",style: new TextStyle(fontSize: 16.0,color: Colors.black)),
                new Container(
                  margin: EdgeInsets.only(top: 15.0),
                  height: industryHeight,
                  child:_buildSelectItem(typesModel.industry),
                )
              ],
            )
          ),
          new Container(
            margin: EdgeInsets.only(left: 15.0,right: 15.0),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text("其他",style: new TextStyle(fontSize: 16.0,color: Colors.black)),
                new Container(
                  margin: EdgeInsets.only(top: 5.0),
                  height: height * 1.5,
                  child: new Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: typesModel.other.map( (text) {
                      return new Container(
                        margin: EdgeInsets.only(left: 10.0,top: 15.0),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            CustomCheck(normalIcon: "images/company/icon_check_normal_17x17_@3x.png",
                              checkIcon: "images/company/icon_check_press_17x17_@3x.png",
                              size: 18,
                              onValueChanged: (isCheck) {

                              },
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text(text),
                            )
                          ],
                        ),
                      );
                    }
                    ).toList(),
                  ),
                )
              ],
            )
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bottomBarHeight = Screen.navigationBarHeight;
    final bottomBarOffsetTop = widget.height - kToolbarHeight - bottomBarHeight;
    return Container( 
      width: Screen.width,
      height: widget.height,
      color: Colors.white,
      child: new Stack(
        children: <Widget>[
          Positioned(
            left: 0.0,
            right: 0.0,
            top: 0.0,
            child: _buildContent(widget.height - bottomBarHeight),
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            top: bottomBarOffsetTop ,
            child: new Container(
              height: bottomBarHeight,
              width: Screen.width,
              color: Colors.white,
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new Container(
                    height: kToolbarHeight,
                    width: Screen.width,
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(widget.themeColor),
                        foregroundColor: MaterialStateProperty.all(Colors.white),
                      ),
                      onPressed: () {
                        if (widget.onSureButtonClick != null) {
                          widget.onSureButtonClick();
                        }
                      },
                      child: Text("确定", style: TextStyle(fontSize: 18.0)),
                    ),
                  )
                ],
              )
            ),
          )
        ],
      ),
    );
  }
}