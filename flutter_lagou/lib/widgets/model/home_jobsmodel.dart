class HomeJobsModel {
  String job_id;
  String job_name;
  String payments;
  String requirements;
  String published_date;
  String company_logo;
  String company_name;
  String company_profile;
  List<String> job_label;

  HomeJobsModel.fromJson(Map data) {
    job_id = data["job_id"];
    job_name =data["job_name"];
    payments =data["payments"];
    requirements =data["requirements"];
    published_date =data["published_date"];
    company_logo =data["company_logo"];
    company_name =data["company_name"];
    company_profile =data["company_profile"];
    
    job_label = [];
    List lables = data["job_label"];
    lables.forEach((label) {
      job_label.add(label);
    });
  }

}