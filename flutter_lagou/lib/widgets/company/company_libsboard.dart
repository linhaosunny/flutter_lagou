import 'package:flutter/material.dart';
import 'package:flutter_lagou/widgets/company/company_public.dart';
import 'package:flutter_lagou/public.dart';


class CompanyLibsboard extends StatefulWidget {
  final ValueChanged<bool> isShowBottomTabbar;

  CompanyLibsboard({Key key,this.isShowBottomTabbar}):super(key:key);

  @override
  _CompanyLibsboardState createState() => _CompanyLibsboardState();
}

class _CompanyLibsboardState extends State<CompanyLibsboard> {
  @override
  List<CompanyModel> companyModels = [];
  TabbarPopType popType =TabbarPopType.popSelectNone;
  Function tabbarReset;
  String cityName;
  String sortName;
  
  Future<void> fetchData() async {
    try {
      var action = 'company_libsdata';
      var responseJson = await Request.post(action: action);
      List moduleData = responseJson['module'];

      moduleData.forEach((data) {
        BaseModel.fromJson(data, "companylibs", (data) {
          companyModels.add(CompanyModel.fromJson(data));
        });
      });

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

  Widget _buildContent() {
    return new Container(
      child: new ListView(
        children: companyModels.map((company) {
          return new CompanyItem(company: company);
        }).toList(),
      )
    );
  }

  Widget _buildTabBar() {
    return CompanyTabbar(cityName: cityName,sortName: sortName, isShowBottomTabbar: (isShow) {
      widget.isShowBottomTabbar(isShow);
    },popTypeChanged: (type) {

      setState(() {
        popType = type;
      });
    },tabbarReset: (callback) {
      tabbarReset = callback;
    },);
  }

  Widget _buildPopContent() {
    final contentHeight = Screen.height - Screen.navigationBarHeight  - kToolbarHeight;

    switch (popType) {
      case TabbarPopType.popSelectCity: 
        return CitysSelect(themeColor: Color.fromARGB(255, 15, 185, 125), 
              height: contentHeight,
              locationIcon: "images/company/search_icon_location_green_11x13_@3x.png",
              onValueChanged: (city) {
                setState(() {
                  cityName = city;
                  Future.delayed(const Duration(milliseconds: 600), () {
                    tabbarReset();
                    setState(() {
                      popType = TabbarPopType.popSelectNone;
                      widget.isShowBottomTabbar(true);
                    });
                  });
                });
              },
            );
      case TabbarPopType.popSelectType:
        return CompanySelect(height: contentHeight + kToolbarHeight,
          themeColor: Color.fromARGB(255, 15, 185, 125),
          onSureButtonClick: () {
            tabbarReset();
            setState(() {
              popType = TabbarPopType.popSelectNone;
              widget.isShowBottomTabbar(true);
            });
          },
        );
      case TabbarPopType.popSort:
        return CompanySort(height: contentHeight,
          sortSelectName: sortName,
          themeColor: Color.fromARGB(255, 15, 185, 125),
          onTapBack: () {
            tabbarReset();
            setState(() {
              popType = TabbarPopType.popSelectNone;
              widget.isShowBottomTabbar(true);
            });
          },
          onSortItemClick: (index,text) {
            tabbarReset();
            setState(() {
              sortName = text;
              popType = TabbarPopType.popSelectNone;
              widget.isShowBottomTabbar(true);
            });
          });
      default:
        return Container();
    }
  }

  Widget build(BuildContext context) {
    return new Stack(
        children: <Widget>[
          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            top: kToolbarHeight,
            child: _buildContent(),
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            top: kToolbarHeight,
            child: _buildPopContent(),
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            top: 0.0,
            child: _buildTabBar()
          )
        ],
      );
  }
}