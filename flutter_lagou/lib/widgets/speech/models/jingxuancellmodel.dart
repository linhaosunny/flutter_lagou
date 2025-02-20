class JingXuanCellModel {
    late String id;
    late String fromTopic;
    late String title;
    late String linkUrl;
    int follow = 0;
    int comment = 19;

    JingXuanCellModel.fromJson(Map data) {
      id = data["id"];
      fromTopic = data["fromTopic"];
      title = data["title"];
      linkUrl = data["link_url"];
      follow = data["follow"];
      comment = data["comment"];
    }
}