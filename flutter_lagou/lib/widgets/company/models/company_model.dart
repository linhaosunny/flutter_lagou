class CompanyModel {
  String company_id;
  String company_name;
  String company_logo;
  String company_evaluation;
  String city;
  String scale;
  String industry;
  String funds_stage;
  int postion_num = 0;
  double company_score = 0.0;
  List<String> company_tags;

  CompanyModel.fromJson(Map data) {
    company_id = data["companyId"];
    company_name = data["companyShortName"];
    company_logo = data["companyLogo"];
    company_evaluation = data["description"];
    company_score = data["companyScore"];
    city = data["city"];
    scale = data["scale"];
    industry = data["industry"];
    postion_num = data["postion_num"];
    company_score = data["companyScore"];
    postion_num = data["positionNum"];
    funds_stage = data["fundsStage"];

    List lables = data["companyTags"];
    if (lables != null && lables.length > 0) {
      company_tags = [];
      lables.forEach((label) {
        company_tags.add(label);
      });
    }

  }
}