class ZhunlanCellModel {
  String id;
  String keyword;
  String title;
  String linkUrl;
  String image;

  ZhunlanCellModel.fromJson(Map data) {
    id = data["id"];
    keyword = data["keyword"];
    title = data["title"];
    linkUrl =data["link_url"];
    image =data["image"];
  }
}