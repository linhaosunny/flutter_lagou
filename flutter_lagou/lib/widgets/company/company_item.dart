import 'package:flutter/material.dart';
import 'package:flutter_lagou/widgets/company/company_public.dart';
import 'package:flutter_lagou/public.dart';

class CompanyItem extends StatelessWidget {
  final CompanyModel company;
  final double height;

  CompanyItem({Key key,this.company,this.height = 130}):super(key:key);

  Widget _buildStar() {
    return new Container(
      child: Stars(score: company.company_score ?? 0,size: 16,),
    );
  }

  Widget _buildItemCell() {
    return new Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  child: new Text(company.company_name ?? '',style: new TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w500),),
                ),
                new Container(
                  padding: new EdgeInsets.only(top: 5.0),
                  child: new Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new Text("面试评分",style: new TextStyle(fontSize: 12,color: Colors.black54)),
                      Padding(
                        padding: EdgeInsets.only(left: 5.0),
                        child: _buildStar(),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: new Text("在招职位 " + company.postion_num.toString(),style:new TextStyle(fontSize: 12,color: Colors.black54)),
                      )
                    ],
                  ),
                ),
                new Container(
                  margin: EdgeInsets.only(top: 5.0 ),
                  child: new Text(company.city + " | " + company.funds_stage + " | " + company.scale + " | " + company.industry,
                    style:new TextStyle(fontSize: 12,color: Colors.black54),
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                  ),
                ),
                new Container(
                  margin: EdgeInsets.only(top: 5.0 ),
                  child: company.company_tags != null ? new Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: company.company_tags.map((label) {
                      final index = company.company_tags.indexOf(label);
                      return index < 5 ? new Container(
                        width: (Screen.width - 110)/ 5 - 5,
                        margin: EdgeInsets.only(right: 5.0),
                        padding: EdgeInsets.only(left: 4.0,right: 4.0,top: 2.0,bottom: 2.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: new Color.fromARGB(255, 242, 242, 245),
                        ),
                        child: new Center(
                          child: new Text(label,style: new TextStyle(fontSize: 10.0,color: Colors.black45),overflow: TextOverflow.ellipsis,softWrap: false,maxLines: 1,),
                        ),
                      ) : new Container() ;
                    }).toList()) :
                    new Container(
                      child: new Text(company.company_evaluation,style:new TextStyle(fontSize: 12,color: Colors.black54))
                    )
                )
              ],
            ),
          )
        ],
      );
  }

  Widget _buildCompanyItem() {
    return new Container(
      height: height,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            height: height - 10,
            padding: EdgeInsets.only(left: 15.0,right: 15.0,top: 15.0),
            color: Colors.white,
            child: _buildItemCell(),
          ),
          new Container(
            height: 10.0,
            color: new Color.fromARGB(255, 242, 242, 245),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildCompanyItem();
  }
}