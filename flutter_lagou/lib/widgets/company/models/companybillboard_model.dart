import 'package:flutter_lagou/widgets/company/company_public.dart';

enum BillboardType {
  list,
  collection,
}

class CompanyBillboardModel {
  late String title;
  late String subTitle;
  late String contentType;
  late BillboardType type;
  late List<CompanyModel> companyModels;
  late List companys;

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