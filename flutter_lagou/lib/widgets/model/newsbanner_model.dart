class NewsBannerModel {
  late String keywordTop;
  late String titleTop;

  late String keywordBottom;
  late String titleBottom;

  NewsBannerModel.fromJson(Map data0,Map data1) {
    keywordTop = data0['keyword'];
    titleTop = data0['title'];

    keywordBottom = data1['keyword'];
    titleBottom = data1['title'];
  }
}