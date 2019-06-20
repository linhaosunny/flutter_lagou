import 'package:flutter/material.dart';
import 'package:flutter_lagou/widgets/company/company_public.dart';
import 'package:flutter_lagou/public.dart';

class BillboardItem extends StatelessWidget {
  final CompanyBillboardModel model;

  BillboardItem({Key key,this.model}) : super(key:key);

  Widget _buildTopBar() {
    return new Container(
      height: 90,
      margin: new EdgeInsets.only(left: 15.0,right: 15.0),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Container(
                  width: Screen.width - 45 - 30,
                  child: new Text(model.title ?? '',style:new TextStyle(fontSize:20.0,color:Colors.black,fontWeight: FontWeight.w500),softWrap: false,overflow: TextOverflow.ellipsis,maxLines: 1,),
                ),
                new Text("更多",style: new TextStyle(fontSize: 14.0,color: new Color.fromARGB(255, 15, 185, 125)),)
              ],
            ),
          ),
          new Container(
            padding: new EdgeInsets.only(top: 5.0),
            child: model.subTitle != '' ? new Text(model.subTitle ?? '',style:new TextStyle(fontSize:12.0,color:Colors.black45)):null,
          )
        ],
      ),
    );
  }

  Widget _buildCompanyList() {
    return new Container(
      child: new Column(
        children: model.companyModels.map((company) {
          return new Container(
            margin: new EdgeInsets.only(left: 15.0,right: 15.0,top: 10.0,bottom: 10.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(company.company_logo ?? ''),
                      fit: BoxFit.contain
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                    border: Border.all(color: Colors.black12,width: 0.6)
                  ),
                ),
                new Container(
                  margin: new EdgeInsets.only(left: 15.0),
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Container(
                        child: new Text(company.company_name ?? '',style: new TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w500),),
                      ),
                      new Container(
                        width: Screen.width - 45 - 60,
                        padding: new EdgeInsets.only(top: 5.0),
                        child: new Text(company.company_evaluation ?? '',style: new TextStyle(fontSize: 12,color: Colors.black54),softWrap: false,overflow: TextOverflow.ellipsis,maxLines: 1),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildCollectionList() {
    return new Container(
      margin: EdgeInsets.only(top: 10.0,bottom: 10.0),
      height: 120,
      child: new ListView(
        scrollDirection: Axis.horizontal,
        children: model.companyModels.map((company) {
          return new Container(
              margin: new EdgeInsets.only(left: 15.0,right: model.companyModels.last == company ? 15.0 : 0.0),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(company.company_logo ?? ''),
                        fit: BoxFit.contain
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                      border: Border.all(color: Colors.black12,width: 0.6)
                    ),
                  ),
                  new Container(
                    width: 80,
                    padding: new EdgeInsets.only(top: 5.0),
                    child: new Text(company.company_name ?? '',style: new TextStyle(fontSize: 14,color: Colors.black54),softWrap: false,overflow: TextOverflow.ellipsis,maxLines: 1),
                  )
                ],
              ),
            );
        }).toList(),
      ),
    );
  }

  Widget _buildListItem() {
    return new Container(
      child: new Column(
        children: <Widget>[
          _buildTopBar(),
          _buildCompanyList(),
        ],
      )
    );
  }

  Widget _buildCollectionItem() {
    return new Container(
      child: new Column(
        children: <Widget>[
          _buildTopBar(),
          _buildCollectionList()
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (model.type) {
      case BillboardType.list:
        return _buildListItem();
      case BillboardType.collection:
        return _buildCollectionItem();
    }
  }
}