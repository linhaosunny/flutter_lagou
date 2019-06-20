import 'package:flutter/material.dart';
import 'package:flutter_lagou/widgets/speech/speech_public.dart';
import 'package:flutter_lagou/public.dart';

class SpeechJingXuan extends StatefulWidget {
  @override
  _SpeechJingXuanState createState() => _SpeechJingXuanState();
}

class _SpeechJingXuanState extends State<SpeechJingXuan> {
  List<JingXuanCellModel> models = [];


 Future<void> fetchData() async {
    try {
      var action = 'jinxuan_data';
      var responseJson = await Request.post(action: action);
      List moduleData = responseJson['module'];

      moduleData.forEach((data) {
        BaseModel.fromJson(data, "topiclist", (data) {
          models.add(JingXuanCellModel.fromJson(data));
        });
      });

      setState(() {
      });

    } catch (e) {
      print('读取错误：' + e.toString());
    }
    // print(Screen.navigationBarHeight);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return new ListView(
      children: models.map((model) {
        return new Container(
          child: new JingxuanItem(model: model),
        );
      }).toList(),
    );
  }
}