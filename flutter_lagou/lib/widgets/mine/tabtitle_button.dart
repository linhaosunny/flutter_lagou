import 'package:flutter/material.dart';

class TabtitleButton extends StatelessWidget {
  final String icon;
  final String title;
  final String buttonTitle;
  final VoidCallback? onPressed;

  TabtitleButton(this.icon,this.title,this.buttonTitle,{Key? key,this.onPressed}) : super(key: key);

  void _onPressed() {
    if (onPressed != null) {
      onPressed!(); // 确保 onPressed 不为 null 后调用
    }
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: onPressed,
      child: new Row(
        children: <Widget>[
          new Container(
              child: new Image.asset(
                icon,
                width: 13.0,
                height: 13.0,
              ),
            ),
            new Container(
              margin: const EdgeInsets.only(left: 8.0),
              child: new Text(
                title,
                style: new TextStyle(color: Colors.black54, fontSize: 15.0)
              ),
            ),
            new Container(
              margin: const EdgeInsets.only(left: 15.0),
              height: 20,
              width: 60,
              child: TextButton(
                onPressed: _onPressed,
                child: new Text(buttonTitle,style: new TextStyle(color: Colors.white, fontSize: 10.0)),
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 15, 185, 125)), shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  side: BorderSide(
                    color: Color.fromARGB(255, 15, 185, 125),
                    style: BorderStyle.solid,
                    width: 1,
                  ),
                ))),
              )
            )
        ],
      ),
    );
  }
}