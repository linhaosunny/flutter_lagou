import 'package:flutter_lagou/widgets/message/message_public.dart';

class MessageChatModel {
  List<String> quikContacts = [];
  List<ChatModel> contactList = [];

  MessageChatModel() :super();

  MessageChatModel.fromJson(List data) {

    data.forEach((data) {
      BaseModel.fromJsonToNormalArray(data, "quickContactList", (data) {
        quikContacts.add(data);
      });

      BaseModel.fromJson(data, "contactList", (data) {
        contactList.add(ChatModel.fromJson(data));
      });
    });
  }
}