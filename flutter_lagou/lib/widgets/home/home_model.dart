
import 'package:flutter_lagou/widgets/home/home_public.dart';

enum HomeModelIndex {
  topBanner,
  newsBanner,
}

class HomeModel {
  String m_s_name;
  List content;
  List<BannerModel> bannerModels;
  List<NewsBannerModel> newsModels;
  List<TopicTabModel> topicTabMenus;
  List<TopicBottomModel> topicBottomModels;

  HomeModel.fromJson(Map data) {
    m_s_name = data['m_s_name'];
    content = data['content'];

    if (m_s_name == 'topbanner') {
      bannerModels = [];
      content.forEach((data) {
        bannerModels.add(BannerModel.fromJson(data));
      });
    }

    if (m_s_name == 'newsbanner') {
      newsModels = [];
      for (int i = 0; i < content.length; i = i + 2) {
        
        var data = content[i];
        Map <dynamic,dynamic> data1 = {"title":"","keyword":""};
        if (i + 1 < content.length) {
          data1 = content[i + 1];
        } 
        newsModels.add(NewsBannerModel.fromJson(data, data1));
      }
    }

    if(m_s_name == 'middletabbar') {
      topicTabMenus = [];
      content.forEach((data) {
        topicTabMenus.add(TopicTabModel.fromJson(data));
      });
    }

    if (m_s_name == "bottomtopic") {
      topicBottomModels = [];
      content.forEach((data) {
        topicBottomModels.add(TopicBottomModel.fromJson(data));
      });
    }
  }
}