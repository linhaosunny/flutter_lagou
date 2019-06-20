import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final VoidCallback onButtonClick;
  final String backgroudImage;
  final Color backgroudColor;
  final String title;
  final TextStyle titleStyle;
  final double width;
  final double height;
  final double borderRadius;

  CustomButton({Key key,this.backgroudImage,this.backgroudColor = Colors.transparent,this.borderRadius = 0.0,this.title,this.titleStyle, this.width,this.height,this.onButtonClick}):super(key:key);
  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {

  void _onTapCustomButton() {
    if (widget.onButtonClick !=null) {
      widget.onButtonClick();
    }
  }

  Widget _buildBackgroudImage() {
    print(widget.backgroudImage);
    return new Container(
      child: new Image.asset(
        'images/welcome/who_see_me_float_113x48_@3x.png',
        fit: BoxFit.cover,
      ),
      constraints: new BoxConstraints.expand(),
    );
  }

  Widget _buildTextView() {
    return new Center(
      child: new Text(widget.title,style: widget.titleStyle),
    );
  }

  @override
  Widget build(BuildContext context) {
   
    return new Align(
      alignment: Alignment.bottomCenter,
      child: new GestureDetector(
        onTap: _onTapCustomButton,
        child: Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            color: widget.backgroudColor,
          ),
          child: new Stack(
            children: <Widget>[
              // _buildBackgroudImage(),
              _buildTextView()
            ],
          ),
        ),
      ),
    );
  }
}