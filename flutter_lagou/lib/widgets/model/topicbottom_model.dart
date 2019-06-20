class TopicBottomModel {
  String left_picture;
  String left_link;

  String righttop_picture;
  String righttop_link;
  String rightbottom_picture;
  String rightbottom_link;

  TopicBottomModel.fromJson(Map data) {
    left_picture = data["left_pic"];
    left_link = data["left_link"];
    righttop_picture = data["righttop_pic"];
    righttop_link = data["righttop_link"];
    rightbottom_picture = data["rightbottom_pic"];
    rightbottom_link =data["rightbottom_link"];
  }
}