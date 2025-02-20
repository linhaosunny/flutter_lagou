import 'package:flutter/material.dart';
import 'package:flutter_lagou/widgets/company/company_public.dart';
import 'package:flutter_lagou/public.dart';

class CitysSelect extends StatefulWidget {
  final double height;
  final Color  themeColor;
  final String locationIcon;
  final ValueChanged<String> onValueChanged;

  CitysSelect({Key? key,required this.height,this.locationIcon = '', this.themeColor = Colors.grey,required this.onValueChanged}): super(key:key);

  @override
  _CitysSelectState createState() => _CitysSelectState();
}

class _CitysSelectState extends State<CitysSelect> {
 List<CitysModel> models = [];
 int currentSelect = 0;
 bool isTap = false;
 bool isHotCitys = false;
 late String selectCityName; 


 Future<void> fetchData() async {
    try {
      var action = 'citys';
      var responseJson = await Request.post(action: action);
      List moduleData = responseJson['provinces'];
      List hotData = responseJson['hotCitys'];

      List<String> hotCitys = [];
      if (hotData !=null && hotData.length > 0) {
        hotData.forEach((city) {
          hotCitys.add(city);
        });
      }

      List<String> historyCitys = [];
      historyCitys.addAll(["广州","深圳","东莞"]);

      CitysModel hotModel = CitysModel(name: "常用",currentCity: "广州",citys: hotCitys,historyCitys: historyCitys);
      models.add(hotModel);

      moduleData.forEach((data) {
        models.add(CitysModel.fromJson(data));
      });

      setState(() {
      });

    } catch (e) {
      print('读取错误：' + e.toString());
    }

  }
  bool isSelect(int index) {
    return currentSelect == index ? true : false;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    fetchData();
  }

  Widget _buildProvincesItem(CitysModel model,int index) {
    return new Container(
      height: 50,
      child: new InkWell(
        onTap: () {
          setState(() {
            currentSelect = index;
          });
        },
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: new Center(
                child: new Text(model.name,style: new TextStyle(fontSize: 16.0,color: isSelect(index) ? Colors.black : Colors.black87,fontWeight: isSelect(index) ? FontWeight.w600:FontWeight.w400),),
              ),
            ),
            new Container(
              width: 4.0,
              height: 20.0,
              color: isSelect(index) ? widget.themeColor : Colors.transparent,
            )
          ],
        ),
      ),
    );
  }

  bool isSelectCity(String cityName,bool isTap,bool isHot) {
    if (cityName == selectCityName && isTap && isHotCitys == isHot) {
      return true;
    }

    return false;
  }

  Widget _buildCitysItem(List<String> citys,bool isHot) {
    return GridView.count(
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      mainAxisSpacing: 15.0,
      crossAxisSpacing: 15.0,
      childAspectRatio: 5/2.5,
      children: citys.map((cityName) {
        return new InkWell(
          onTap: () {
            widget.onValueChanged(cityName);
            selectCityName = cityName;
            isHotCitys = isHot;
            setState(() {
              isTap = true;
            });
          },
          child:  new Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: isSelectCity(cityName, isTap,isHot) ? widget.themeColor.withOpacity(0.08) : Colors.transparent,
              border: Border.all(width: 1.0,color:isSelectCity(cityName, isTap,isHot) ? widget.themeColor: new Color.fromARGB(255, 242, 242, 245))
            ),
            child: new Center(
              child: new Text(cityName, softWrap: false,overflow: TextOverflow.ellipsis,maxLines: 1,style: new TextStyle(
                color: isSelectCity(cityName, isTap,isHot) ? widget.themeColor: Colors.black87
              ),),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildNormalCitys() {
    final double width = (Screen.width * 0.75 - 15.0 * 4) / 3;
    final double height = width * 0.5 + 15.0;
    final historyCitysHeight = (models[currentSelect].historyCitys.length % 3 == 0) ? height * (models[currentSelect].historyCitys.length / 3) : height * (models[currentSelect].historyCitys.length / 3 + 1);
    final hotCitysHeight =  (models[currentSelect].citys.length % 3 == 0) ? height * (models[currentSelect].citys.length / 3) : height * (models[currentSelect].citys.length / 3 + 1);
    
    return new Container(
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text("当前定位",style: new TextStyle(fontSize: 15.0,color: Colors.black)),
                new Container(
                  margin: EdgeInsets.only(top: 15.0,bottom: 15.0),
                  child: new Container(
                    width: width,
                    height: height - 15.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      border: Border.all(width: 1.0,color: new Color.fromARGB(255, 242, 242, 245))
                    ),
                    child: new Center(
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Container(
                            child: new Image.asset(
                              widget.locationIcon,
                              width: 11.0,
                              height: 13.0,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5.0),
                            child: new Text(models[currentSelect].currentCity,style: TextStyle(color: widget.themeColor) , softWrap: false,overflow: TextOverflow.ellipsis,maxLines: 1,),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          new Container(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text("最近访问",style: new TextStyle(fontSize: 15.0,color: Colors.black)),
                new Container(
                  margin: EdgeInsets.only(top: 15.0),
                  height: historyCitysHeight,
                  child:_buildCitysItem(models[currentSelect].historyCitys,false),
                )
              ],
            ),
          ),
          new Container(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text("热门城市",style: new TextStyle(fontSize: 15.0,color: Colors.black),),
                new Container(
                  margin: EdgeInsets.only(top: 15.0),
                  height: hotCitysHeight,
                  child: _buildCitysItem(models[currentSelect].citys,true),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCitysList() {
    if (models != null && models.length > 0 ) {
      
      return new Container(
        margin: new EdgeInsets.only(left: 15.0,top:15.0,right: 15.0),
        child: currentSelect != 0 ? _buildCitysItem(models[currentSelect].citys,isHotCitys) 
          : _buildNormalCitys(),
      );
    }

    return new Container();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Screen.width,
        height: widget.height,
        child: new Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: new Container(
                color: new Color.fromARGB(255, 242, 242, 245),
                child: ListView(
                  children: models.map((model) {
                    final index = models.indexOf(model);
                    return _buildProvincesItem(model, index);
                  }).toList(),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: new Container(
                color: Colors.white,
                child: _buildCitysList(),
              ),
            )
          ],
        ),
    );
  }
}