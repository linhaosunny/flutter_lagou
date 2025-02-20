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

  ChatBarModel({required this.icon,required this.type}):super();
}