class PostJobModel {
  late int jobId;
  late String jobName;
  late String jobSalary;
  late String jobCity;
  late String jobWorkYear;
  late String jobEducation;
  late String jobCompany;

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