import 'package:flutter_lagou/widgets/message/models/msgcontent_model.dart';
import 'package:flutter_lagou/widgets/message/models/postjob_model.dart';
import 'package:flutter_lagou/widgets/model/base_model.dart';

class ChatMsgModel {
  List<MsgContentModel> messages = [];
  String companyName;

  ChatMsgModel():super();

  ChatMsgModel.fromJson(List data) {
    data.forEach((data) {

      BaseModel.fromJsonToNormalData(data, "chatStateMsg", (data) {
        messages.add(MsgContentModel(type: ChatMessageType.tipMessage,postMessage: data.toString()));
      });

      BaseModel.fromJsonToNormal(data, "postJobInfo", (data) {
        PostJobModel jobModel = PostJobModel.fromJson(data);
        companyName = jobModel.jobCompany;
        messages.add(MsgContentModel(type:ChatMessageType.jobMessage,postJob: jobModel));
      });

      BaseModel.fromJson(data, "chatMsgList", (data) {
        messages.add(MsgContentModel.fromJson(data));
      });

    });
  }
}