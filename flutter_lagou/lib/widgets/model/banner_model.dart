
class BannerModel {
  String imageUrl;
  String link;

  BannerModel.fromJson(Map data) {
    imageUrl = data['image_url'];
    link = data['link_url'];
  }
}