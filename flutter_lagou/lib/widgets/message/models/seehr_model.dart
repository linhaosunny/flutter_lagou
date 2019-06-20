import 'package:flutter_lagou/widgets/message/models/matchjob_model.dart';

class SeeHRModel {
  String hrName;
  String hrImage;
  String hrJob;
  String companyName;
  int timestamp;
  MatchJobModel matchJob;

  SeeHRModel.fromJson(Map data) {
    hrName = data["name"];
    hrImage = data["portrait"];
    hrJob = data["hrTitle"];
    companyName = data["companyName"];
    timestamp = data["dateTime"];
    Map matchJobJson = data["autoMatchPosition"];
    if (matchJobJson != null) {
      matchJob = MatchJobModel.fromJson(matchJobJson);
    }
  }
}