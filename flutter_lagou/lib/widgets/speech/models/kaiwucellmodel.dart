import 'package:flutter_lagou/widgets/speech/speech_public.dart';

class KaiWuCellModel {
  String title;
  String tag;
  KaiWuCourseModel course_model;
  int product_id = 0;
  bool purchased = false;

  KaiWuCellModel.fromJson(Map data) {
    title = data["title"];
    tag = data["tag"];
    course_model = KaiWuCourseModel.fromJson(data["courseInfo"]);
    product_id = data["productId"];
    purchased = data["purchased"];
  }
}