
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:meta/meta.dart';

class VisibleFocusedWidget extends StatefulWidget {
  const VisibleFocusedWidget({Key? key,
    required this.focusNode,
    required this.child,
    this.curve = Curves.fastOutSlowIn,
    required this.onVisibleFocusechanged,
    this.duration = const Duration(milliseconds: 250)
  }) : super(key:key);

  final FocusNode focusNode;

  final Widget child;

  final Curve curve;

  final Duration duration;

  final ValueChanged<Function> onVisibleFocusechanged;

  @override
  _VisibleFocusedWidgetState createState() => _VisibleFocusedWidgetState();

}

class _VisibleFocusedWidgetState extends State<VisibleFocusedWidget> with WidgetsBindingObserver {
  
  Future<Null> _ensureVisible() async {
    await Future.any([new Future.delayed(const Duration(milliseconds:100)),_keyboardToggled()]);

    if (!widget.focusNode.hasFocus) {
      return;
    }

   

    final RenderObject? object = context.findRenderObject();
    if (object == null) {
      return;
    }
    
    final RenderAbstractViewport viewport = RenderAbstractViewport.of(object);
    assert(viewport != null);

    ScrollableState scrollableState = Scrollable.of(context);
    assert(scrollableState != null);

    ScrollPosition position = scrollableState.position;
    double alignment;

    if (position.pixels > viewport.getOffsetToReveal(object, 0.0).offset) {
      alignment = 0.0;
    } else if (position.pixels < viewport.getOffsetToReveal(object, 1.0).offset) {
      alignment = 1.0;
    } else {
      return;
    }

    position.ensureVisible(
      object,
      alignment: alignment,
      duration: widget.duration,
      curve: widget.curve,
    );
  }

  Future<Null> _keyboardToggled() async {
    if (mounted) {
      EdgeInsets edgeInsets = MediaQuery.of(context).viewInsets;
      while (mounted && MediaQuery.of(context).viewInsets ==edgeInsets ) {
        await new Future.delayed(const Duration(milliseconds:10));
      }
    }

    return;
  }

  Future<Null> updateVisible() async {
    await Future.any([new Future.delayed(const Duration(milliseconds:100)),_keyboardToggled()]);

    if (!widget.focusNode.hasFocus) {
      return;
    }

   

    final RenderObject? object = context.findRenderObject();
    if (object == null) {
      return;
    }

    final RenderAbstractViewport viewport = RenderAbstractViewport.of(object);
    assert(viewport != null);

    ScrollableState scrollableState = Scrollable.of(context);
    assert(scrollableState != null);

    ScrollPosition position = scrollableState.position;
    double alignment;

    if (position.pixels > viewport.getOffsetToReveal(object, 0.0).offset) {
      alignment = 0.0;
    } else if (position.pixels < viewport.getOffsetToReveal(object, 1.0).offset) {
      alignment = 1.0;
    } else {
      alignment = 1.0;
    }

    

    position.ensureVisible(
      object,
      alignment: alignment,
      duration: widget.duration,
      curve: widget.curve,
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.focusNode.addListener(_ensureVisible);
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    widget.focusNode.addListener(_ensureVisible);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    // TODO: implement didChangeMetrics
    if (widget.focusNode.hasFocus) {
      _ensureVisible();
    }
  }
  
  @override
  Widget build(BuildContext context) {
    if (widget.onVisibleFocusechanged != null) {
      widget.onVisibleFocusechanged(updateVisible);
    }
    return widget.child;
  }
}