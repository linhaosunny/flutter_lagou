class ZhunlanCellModel {
  late String id;
  late String keyword;
  late String title;
  late String linkUrl;
  late String image;

  ZhunlanCellModel.fromJson(Map data) {
    id = data["id"];
    keyword = data["keyword"];
    title = data["title"];
    linkUrl =data["link_url"];
    image =data["image"];
  }
}