class ChatModel {
  late String image;
  late String hrName;
  late String companyName;
  late String lastSay;
  late String dateString;

  ChatModel.fromJson(Map data) {
    image = data["img"];
    hrName = data["HRName"];
    companyName = data["company"];
    lastSay = data["content"];
    dateString = data["date"];
  }
  
}