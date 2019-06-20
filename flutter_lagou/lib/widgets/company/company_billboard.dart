import 'package:flutter/material.dart';
import 'package:flutter_lagou/widgets/company/company_public.dart';
import 'package:flutter_lagou/public.dart';

class CompanyBillboard extends StatefulWidget {
  @override
  _CompanyBillboardState createState() => _CompanyBillboardState();
}

class _CompanyBillboardState extends State<CompanyBillboard> {
  List<CompanyBillboardModel> models = [];

 Future<void> fetchData() async {
    try {
      var action = 'company_billboarddata';
      var responseJson = await Request.post(action: action);
      List moduleData = responseJson['module'];

      moduleData.forEach((data) {
        BaseModel.fromJson(data, "billboardlist", (data) {
          models.add(CompanyBillboardModel.fromJson(data));
        });
      });

      setState(() {
      });

    } catch (e) {
      print('读取错误：' + e.toString());
    }

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.white,
      child: new ListView(
        children: models.map((model) {
          return new Container(
            child: BillboardItem(model: model),
          );
        }).toList(),
      ),
    );
  }
}