import 'package:flutter_lagou/widgets/message/models/matchjob_model.dart';

class SeeHRModel {
  late String hrName;
  late String hrImage;
  late String hrJob;
  late String companyName;
  late int timestamp;
  late MatchJobModel matchJob;

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