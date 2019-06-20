import 'package:flutter_lagou/widgets/company/company_public.dart';

enum BillboardType {
  list,
  collection,
}

class CompanyBillboardModel {
  String title;
  String subTitle;
  String contentType;
  BillboardType type;
  List<CompanyModel> companyModels;
  List companys;

  CompanyBillboardModel.fromJson(Map data) {
    title = data["title"];
    subTitle = data["sub_title"];
    contentType = data["content_type"];
    type = contentType == "billboard" ? BillboardType.list : BillboardType.collection;
    companys = data["companys"];
    
    companyModels = [];
    companys.forEach((data) {
      companyModels.add(CompanyModel.fromJson(data));
    });
  }
}