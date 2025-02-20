import 'package:flutter_lagou/widgets/message/models/postjob_model.dart';
import 'dart:math';
import 'dart:io';

enum ChatMessageType {
  tipMessage,
  jobMessage,
  textMessage,
  inviteJobMessage,
  pictureMessage,
}

enum ChatMessageUserType {
  other,
  myself,
}

class MsgContentModel {
  late ChatMessageType type;
  late ChatMessageUserType from;
  late String headImage;
  late String textContent;
  late String date;
  String? postMessage;
  PostJobModel? postJob;
  late File pictureFile;

  MsgContentModel({required this.type,this.postMessage,this.postJob}):super();

  MsgContentModel.fromJson(Map data) {
    headImage = data["headImg"];
    textContent = data["content"];
    date = data["date"];
    int messageType = data["type"];
    from = ChatMessageUserType.other;

    switch (messageType) {
      case 1:
        type = ChatMessageType.textMessage;
        break;
      case 2:
        type = ChatMessageType.inviteJobMessage;
        break;
      default:
    }
  }
}