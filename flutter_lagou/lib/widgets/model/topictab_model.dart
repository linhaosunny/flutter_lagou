class TopicTabModel {
  late String picture;
  late String link;

  TopicTabModel.fromJson(Map data) {
    picture = data['pic'];
    link = data['link'];
  }
}