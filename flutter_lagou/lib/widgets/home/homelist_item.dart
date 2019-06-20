import 'package:flutter/material.dart';
import 'package:flutter_lagou/public.dart';
import 'package:flutter_lagou/widgets/home/home_public.dart';

class HomeListItem extends StatelessWidget {
  final HomeJobsModel jobsModel;

  HomeListItem({Key key,this.jobsModel}):super(key:key);

  Widget _buildJobsCell(bool showlabels) {
    return new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              margin: new EdgeInsets.only(top: 10.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Text(jobsModel.job_name ?? '',
                  style: new TextStyle(
                    fontSize: 16.0,
                    color: Colors.black87
                    )
                  ),
                  new Text(jobsModel.payments ?? '',style:new TextStyle(fontSize: 14.0,color: Colors.deepOrange))
                ],
              ),
            ),
            new Container(
              margin: new EdgeInsets.only(top: 2.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Text(jobsModel.requirements ?? '',
                  style: new TextStyle(
                    fontSize: 12.0,
                    color: Colors.black45
                    )
                  ),
                  new Text(jobsModel.published_date ?? '',style:new TextStyle(fontSize: 12.0,color: Colors.black45))
                ],
              ),
            ),
            new Container(
              margin: EdgeInsets.only(top: showlabels ? 5.0 : 0.0),
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: jobsModel.job_label != null ? jobsModel.job_label.map((label) {
                  return new Container(
                    margin: EdgeInsets.only(left: 5.0,right: 5.0),
                    padding: EdgeInsets.only(left: 5.0,right: 5.0,top: 2.0,bottom: 2.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: new Color.fromARGB(255, 242, 242, 245),
                    ),
                    child: new Text(label,style: new TextStyle(fontSize: 11.0,color: Colors.black45),),
                  );
                }).toList() : null),
            ),
            new Container(
              margin: new EdgeInsets.only(top: 10.0),
              child: new Row(
                children: <Widget>[
                  new Container(
                    height: 40,
                    width: 40,
                    child: new FadeInImage.assetNetwork(
                      placeholder: globalPlaceHolderImage,
                      image: jobsModel.company_logo,
                      fit: BoxFit.contain,
                    ),
                  ),
                  new Container(
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Container(
                          padding: EdgeInsets.only(left: 10.0),
                          child: new Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              new Text(jobsModel.company_name ?? '',style: new TextStyle(fontSize: 15.0,color: Colors.black45,),),
                              new Text(jobsModel.company_profile ?? '',style:new TextStyle(fontSize: 12.0,color: Colors.black45))
                            ],
                          ),
                        )
                      ],

                    ),
                  )
                ],
              ),
            )
          ],
        );
  }
  @override
  Widget build(BuildContext context) {
    bool showlabel = jobsModel.job_label !=null ? (jobsModel.job_label.length > 0 ? true : false) : false;
    double height = showlabel ? 140 : 120;
    return Container(
      color: Colors.white,
      height: height,
      child: new Column(
        children: <Widget>[
          new Container(
            height: height - 10,
            padding: EdgeInsets.only(left: 15.0,right: 15.0),
            child: _buildJobsCell(showlabel),
          ),
          new Container(
              height: 10.0,
              color: new Color.fromARGB(255, 242, 242, 245),
          ),
        ],
      )
    );
  }
}