
import 'package:flutter_lagou/widgets/home/home_public.dart';

class HomeModel {
  String m_s_name;
  List content;
  List<BannerModel> bannerModels;

  HomeModel.fromJson(Map data) {
    m_s_name = data['m_s_name'];
    content = data['content'];

    if (m_s_name == 'topbanner') {
      bannerModels = [];
      content.forEach((data) {
        bannerModels.add(BannerModel.fromJson(data));
      });
    }

  }
}