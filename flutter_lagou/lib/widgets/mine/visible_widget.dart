import 'package:flutter/material.dart';

class VisibleWidget extends StatelessWidget {
  final bool visible;
  final Widget container;

  const VisibleWidget(this.container,{Key? key,required this.visible}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new Offstage(
      offstage: !visible,
      child: container,
    );
  }
}