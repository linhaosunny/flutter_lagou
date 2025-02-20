class HomeJobsModel {
  late String job_id;
  late String job_name;
  late String payments;
  late String requirements;
  late String published_date;
  late String company_logo;
  late String company_name;
  late String company_profile;
  late List<String> job_label;

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