class MatchJobModel {
  int jobId;
  String jobName;
  String jobSalary;
  String jobCity;
  String jobWorkYear;
  String jobEducation;
  String jobDescribtion;

  MatchJobModel.fromJson(Map data) {
    jobId = data["positionId"];
    jobName = data["positionName"];
    jobSalary = data["salary"];
    jobCity = data["city"];
    jobWorkYear = data["workYear"];
    jobEducation = data["education"];
    jobDescribtion = data["matchDesc"];
  }
}