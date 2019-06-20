class TopicTabModel {
  String picture;
  String link;

  TopicTabModel.fromJson(Map data) {
    picture = data['pic'];
    link = data['link'];
  }
}