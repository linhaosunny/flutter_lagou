import 'package:flutter/material.dart';
import 'package:flutter_lagou/widgets/mine/tabmenu_item.dart';
import 'package:flutter_lagou/widgets/mine/listmenu_item.dart';
import 'package:flutter_lagou/widgets/mine/tabtitle_button.dart';

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: new CustomScrollView(
        slivers: <Widget>[
          new SliverList(
            delegate: new SliverChildListDelegate(
              <Widget>[
                new Container(
                  color: Colors.white,
                  padding: const EdgeInsets.only(
                    top: 60.0,
                  ),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Expanded(
                        flex: 3,
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Padding(
                              padding: const EdgeInsets.only(
                                top: 30.0,
                                left: 30.0,
                                right: 60.0,
                                bottom: 15.0,
                              ),
                              child: new Text(
                                'sunshine.lee',
                                overflow: TextOverflow.ellipsis,
                                softWrap: false,
                                style: new TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 35.0
                                ),
                              ),
                            ),
                            new Padding(
                              padding: const EdgeInsets.only(
                                left: 30.0,
                              ),
                              child: new TabtitleButton('images/mine/icon_edit_pencil_11x11_@3x.png', '编辑在线简历', '100分'),
                            )
                          ],
                        ),
                      ),
                      new Expanded(
                        flex: 1,
                        child: new Padding(
                          padding: const EdgeInsets.only(
                            top: 40.0,
                            right: 30.0,
                          ),
                          child: new Stack(
                            children: <Widget>[
                              new CircleAvatar(
                                radius: 35.0,
                                backgroundImage: new AssetImage('images/mine/default_mine.jpg'),
                              ),
                              new Container(
                                margin: new EdgeInsets.only(
                                  top: 48,
                                  left: 48
                                ),
                                child: new Image.asset('images/mine/icon_resume_edit_sex_man_24x24_@3x.png',
                                  width: 22.0,
                                  height: 22.0,
                                ),
                              )
                              
                            ],
                          )
                        ),
                      )
                    ],
                  )
                ),
                new Container(
                  color: Colors.white,
                  child: new Padding(
                    padding: const EdgeInsets.only(
                      top: 30.0,
                      bottom: 30.0,
                    ),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        new TabmenuItem('images/mine/setting_logo_resume_33x33_@3x.png', '附件简历', onPressed: () {
                          
                        },),
                        new TabmenuItem('images/mine/setting_logo_deliver_33x33_@3x.png', '我的投递', onPressed: () {
                          
                        },),
                        new TabmenuItem('images/mine/setting_logo_attention_33x33_@3x.png', '关注公司', onPressed: () {
                          
                        },),
                        new TabmenuItem('images/mine/setting_logo_collect_31x31_@3x.png', '职位收藏', onPressed: () {
                          
                        },)
                      ],
                    ),
                  ),
                ),
                new Container(
                  color: new Color.fromARGB(255, 242, 242, 245),
                  height: 10.0,
                ),
                new Container(
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      new ListMenuItem('images/mine/setting_logo_intention_22x22_@3x.png', '求职意向','','随便看看',false, onPressed: () {
                          
                        },),
                      new ListMenuItem('images/mine/setting_logo_privacy_22x22_@3x.png', '隐私设置','','',false, onPressed: () {
                          
                        },),
                      new ListMenuItem('images/mine/setting_logo_hunter_23x23_@3x.png', '拉勾猎头','images/mine/icon_setting_hunter_new_32x15_@3x.png','升职加薪好帮手',true, onPressed: () {
                          
                        },),
                      new ListMenuItem('images/mine/setting_logo_Wallet_21x21_@3x.png', '我的钱包','','',false, onPressed: () {
                          
                        },),
                      new ListMenuItem('images/mine/setting_logo_notifica_22x22_@3x.png', '通知','','',false, onPressed: () {
                          
                        },),
                      new ListMenuItem('images/mine/setting_logo_setting_22x22_@3x.png', '设置','','',false, onPressed: () {
                          
                        },),
                      new ListMenuItem('images/mine/setting_logo_suggest_22x22_@3x.png', '帮助与反馈','','',false, onPressed: () {
                          
                        },),
                    ],
                  ),
                )
              ]
            ),
          )
        ],
      ),
    );
  }
}