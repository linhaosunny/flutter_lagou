class TopicBottomModel {
  late String left_picture;
  late String left_link;

  late String righttop_picture;
  late String righttop_link;
  late String rightbottom_picture;
  late String rightbottom_link;

  TopicBottomModel.fromJson(Map data) {
    left_picture = data["left_pic"];
    left_link = data["left_link"];
    righttop_picture = data["righttop_pic"];
    righttop_link = data["righttop_link"];
    rightbottom_picture = data["rightbottom_pic"];
    rightbottom_link =data["rightbottom_link"];
  }
}