class ChatModel {
  String image;
  String hrName;
  String companyName;
  String lastSay;
  String dateString;

  ChatModel.fromJson(Map data) {
    image = data["img"];
    hrName = data["HRName"];
    companyName = data["company"];
    lastSay = data["content"];
    dateString = data["date"];
  }
  
}