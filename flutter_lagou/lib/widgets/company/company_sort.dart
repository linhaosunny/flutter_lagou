import 'package:flutter/material.dart';
import 'package:flutter_lagou/public.dart';

class CompanySort extends StatefulWidget {
  final double height;
  String sortSelectName;
  Color themeColor;
  Function(int,String) onSortItemClick;
  Function onTapBack;

  CompanySort({Key? key,required this.height,required this.themeColor,required this.sortSelectName,required this.onTapBack,required this.onSortItemClick}) : super(key:key);
  
  @override
  _CompanySortState createState() => _CompanySortState();
}

class _CompanySortState extends State<CompanySort> {
  List<String> sorts = [ "智能排序","好评优先","最近发布职位"];
  int selectIndex = 0;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sorts.forEach((text) {
       var index = sorts.indexOf(text);
      if (widget.sortSelectName == text) {
        selectIndex = index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Screen.width,
        height: widget.height,
        color:Colors.black.withOpacity(0.5),
        child: new Column(
          children: <Widget>[
            new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: sorts.map((text){
                var index = sorts.indexOf(text);
                return InkWell(
                  onTap: () {
                    if (widget.onSortItemClick !=null) {
                      widget.onSortItemClick(index,text);
                    }
                    
                    setState(() {
                      selectIndex = index;
                    });
                  },
                  child: new Container(
                    width: Screen.width,
                    height: 45.0,
                    color: Colors.white,
                    child: new Center(
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Text(text,style: new TextStyle(fontSize:14.0,color: selectIndex == index ? widget.themeColor : Colors.black)),
                          new Container(
                            margin: EdgeInsets.only(top: 15.0),
                            child: new Divider(height: 1.0,),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            new Expanded(
              child: new InkWell(
                onTap: () {
                  if (widget.onTapBack != null) {
                    widget.onTapBack();
                  }
                },
              ),
            )
          ],
        ),
      );
  }
}