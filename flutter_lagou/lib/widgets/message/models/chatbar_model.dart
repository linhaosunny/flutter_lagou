enum ChatBarItemType {
  voice,
  picture,
  camera,
  emoji,
  post,
}

class ChatBarModel {
  ChatBarItemType type;
  String icon;

  ChatBarModel({this.icon,this.type}):super();
}