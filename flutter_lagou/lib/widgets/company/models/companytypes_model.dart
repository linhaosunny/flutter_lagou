class CompanyTypesModel {
  List<String> financing = []; 
  List<String> scale = [];
  List<String> industry = [];
  List<String> other = [];

  CompanyTypesModel():super();

  CompanyTypesModel.fromJson(Map data) {
    List companyFinancing = data["companyFinancing"];
    List companyScale = data["companyScale"];
    List companyIndustry = data["companyIndustry"];
    List companyOther = data["other"];

    if (companyFinancing !=null && companyFinancing.length > 0) {
      companyFinancing.forEach((data) {
        financing.add(data);
      }); 
    }

    if (companyScale !=null && companyScale.length > 0) {
      companyScale.forEach((data) {
        scale.add(data);
      }); 
    }

    if (companyIndustry !=null && companyIndustry.length > 0) {
      companyIndustry.forEach((data) {
        industry.add(data);
      }); 
    }

    if (companyOther !=null && companyOther.length > 0) {
      companyOther.forEach((data) {
        other.add(data);
      }); 
    }

  }
}