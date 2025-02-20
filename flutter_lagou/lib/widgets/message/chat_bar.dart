import 'package:flutter/material.dart';
import 'package:flutter_lagou/widgets/message/models/chatbar_model.dart';
import 'package:flutter_lagou/widgets/message/visiblefocused_widget.dart' show VisibleFocusedWidget;

class ChatBar extends StatefulWidget {
  final Function(ChatBarItemType) onChatBarItemClick;
  final Color themeColor;
  final ValueChanged<double> onTextFieldMuiltLineHeightChanged;
  final ValueChanged<Function> onVisibleFocusechanged;
  final ValueChanged<String> onCompletedTextInput;

  ChatBar({Key? key,required this.themeColor,required this.onChatBarItemClick,required this.onCompletedTextInput,required this.onVisibleFocusechanged,required this.onTextFieldMuiltLineHeightChanged}):super(key:key);
  @override
  _ChatBarState createState() => _ChatBarState();
}

class _ChatBarState extends State<ChatBar> {
  List<ChatBarModel> barItems = [
    ChatBarModel(icon: 'images/message/icon_chat_sound_25x25_@3x.png',type: ChatBarItemType.voice),
    ChatBarModel(icon: 'images/message/icon_chat_takepicture_25x25_@3x.png',type: ChatBarItemType.picture),
    ChatBarModel(icon: 'images/message/icon_chat_camera_25x25_@3x.png',type: ChatBarItemType.camera),
    ChatBarModel(icon: 'images/message/icon_chat_emoji_25x25_@3x.png',type: ChatBarItemType.emoji),
    ChatBarModel(icon: 'images/message/icon_chat_quickreply_25x25_@3x.png',type: ChatBarItemType.post),
  ];
 
  TextEditingController controller = TextEditingController();

  FocusNode focusNode = FocusNode();
  double _firstHeight = 0.0;
  double _lastHeight = 0.0;

  Widget _buildTextField() {
    return TextField(
      textInputAction: TextInputAction.send,
      focusNode: focusNode,
      controller: controller,
      cursorColor: widget.themeColor,
      cursorWidth: 1.5,
      maxLines: 4,
      minLines: 1,
      enabled: true,
      enableInteractiveSelection: true,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 5.0,right: 0.0,top: 10.0,bottom: 10.0),
        enabled: true,
        labelStyle: TextStyle(fontSize: 12.0,color: Colors.black45),
        fillColor: Colors.white,
        filled: true,
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(color: Colors.black12,width: 0.8)
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(color: Colors.black12,width: 0.8)
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(color: Colors.black12,width: 0.8)
        ),
      ),
      onSubmitted: (text) {
        if (widget.onCompletedTextInput != null && text != '') {
          widget.onCompletedTextInput(text);
        }
        controller.clear();
        controller.clearComposing();
      }
    );
  }

  Widget _buildInputBar() {
    return new Container(
      margin: EdgeInsets.only(left: 15.0,top: 10.0, right: 15.0),
      child: _buildTextField(),
    );
  }

 Widget _buildMenuBar() {
   return new Container(
      height: kToolbarHeight,
      margin: EdgeInsets.only(left: 15.0, right: 15.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: barItems.map((model) {
          return new InkWell(
            onTap: () {
              if (widget.onChatBarItemClick != null) {
                widget.onChatBarItemClick(model.type);
              }
            },
            child: new Row(
              children: <Widget>[
                new Container(
                  child: Image.asset(model.icon,
                    fit: BoxFit.cover,
                    width: 25,
                    height: 25,
                  ),
                )
              ],
            ),
          );
        }).toList(),
      ),
    );
 }
  
  Widget _buildContent() {
    return Container(
      child: new Column(
        children: <Widget>[
          _buildInputBar(),
          _buildMenuBar()
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _firstHeight = 0.0;
    _lastHeight = 0.0;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
     
    return new VisibleFocusedWidget(
      focusNode: focusNode,
      child: _buildContent(),
      onVisibleFocusechanged: widget.onVisibleFocusechanged,
    );
  }
}