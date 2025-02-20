class KaiWuCourseModel {
  late String title;
  late String sub_title;
  int  original_price = 0;
  int price = 0;
  late String image;
  late String presenter_name;
  late String presenter_title;
  late String h5_link;
  int  totalChapter = 0;

  KaiWuCourseModel.fromJson(Map data) {
    title = data["title"];
    sub_title = data["subTitle"];
    original_price = data["originalPrice"];
    price = data["price"];
    image = data["image"];
    presenter_name = data["presenterName"];
    presenter_title = data["presenterTitle"];
    h5_link = data["h5Url"];
    totalChapter = data["4"];
  }
}