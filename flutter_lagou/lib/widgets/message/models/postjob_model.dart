class PostJobModel {
  int jobId;
  String jobName;
  String jobSalary;
  String jobCity;
  String jobWorkYear;
  String jobEducation;
  String jobCompany;

  PostJobModel.fromJson(Map data) {
    jobId = data["positionId"];
    jobName = data["positionName"];
    jobSalary = data["salary"];
    jobCity = data["city"];
    jobWorkYear = data["workYear"];
    jobEducation = data["education"];
    jobCompany = data["companyName"];
  }
}