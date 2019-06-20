import 'package:flutter/material.dart';
import 'package:flutter_lagou/widgets/speech/speech_public.dart';
import 'package:flutter_lagou/public.dart';

class SpeechZhuanlan extends StatefulWidget {
  @override
  _SpeechZhuanlanState createState() => _SpeechZhuanlanState();
}

class _SpeechZhuanlanState extends State<SpeechZhuanlan> {
  List <ZhunlanCellModel> models = [];

  Future<void> fetchData() async {
    try {
      var action = 'zhuanlan_data';
      var responseJson = await Request.post(action: action);
      List moduleData = responseJson['module'];

      moduleData.forEach((data) {
        BaseModel.fromJson(data, "columnlist", (data) {
          models.add(ZhunlanCellModel.fromJson(data));
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
          child: new ZhuanlanItem(model: model),
        );
      }).toList(),
    );
  }
}