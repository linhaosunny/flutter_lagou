// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/widgets.dart';

import 'package:flutter/src/material/colors.dart';

/// Used with [TabBar.indicator] to draw a horizontal line below the
/// selected tab.
///
/// The selected tab underline is inset from the tab's boundary by [insets].
/// The [borderSide] defines the line's color and weight.
///
/// The [TabBar.indicatorSize] property can be used to define the indicator's
/// bounds in terms of its (centered) widget with [TabIndicatorSize.label],
/// or the entire tab with [TabIndicatorSize.tab].
class CustomUnderlineTabIndicator extends Decoration {
  /// Create an underline style selected tab indicator.
  ///
  /// The [borderSide] and [insets] arguments must not be null.
  const CustomUnderlineTabIndicator({
    this.borderSide = const BorderSide(width: 2.0, color: Colors.white),
    this.insets = EdgeInsets.zero,
    this.width = 0.0,
  }) : assert(borderSide != null), assert(insets != null);

  /// The color and weight of the horizontal line drawn below the selected tab.
  final BorderSide borderSide;

  /// Locates the selected tab's underline relative to the tab's boundary.
  ///
  /// The [TabBar.indicatorSize] property can be used to define the
  /// tab indicator's bounds in terms of its (centered) tab widget with
  /// [TabIndicatorSize.label], or the entire tab with [TabIndicatorSize.tab].
  final EdgeInsetsGeometry insets;

  /// Locates the selected tab's underline relative to the tab's boundary.
  ///
  /// The tab widget with[TabIndicatorSize.label], or the entire tab with [TabIndicatorSize.tab] are not use when width not zero.
  /// 
  final double width;

  @override
  Decoration? lerpFrom(Decoration? a, double t) {
    if (a is CustomUnderlineTabIndicator) {
      return CustomUnderlineTabIndicator(
        borderSide: BorderSide.lerp(a.borderSide, borderSide, t),
        insets: EdgeInsetsGeometry.lerp(a.insets, insets, t) ?? EdgeInsets.zero,
      );
    }
    return super.lerpFrom(a, t);
  }

  @override
  Decoration? lerpTo(Decoration? b, double t) {
    if (b is CustomUnderlineTabIndicator) {
      return CustomUnderlineTabIndicator(
        borderSide: BorderSide.lerp(borderSide, b.borderSide, t),
        insets: EdgeInsetsGeometry.lerp(insets, b.insets, t) ?? EdgeInsets.zero,
      );
    }
    return super.lerpTo(b, t);
  }

  @override
  _UnderlinePainter createBoxPainter([VoidCallback onChanged = _emptyCallback]) {
    return _UnderlinePainter(this,width, onChanged);
  }

  // 定义一个空函数作为默认值
  static void _emptyCallback() {}
}

class _UnderlinePainter extends BoxPainter {
  _UnderlinePainter(this.decoration,this.indicatorWidth, VoidCallback onChanged)
    : assert(decoration != null), super(onChanged);

  final CustomUnderlineTabIndicator decoration;
  final indicatorWidth;

  BorderSide get borderSide => decoration.borderSide;
  EdgeInsetsGeometry get insets => decoration.insets;

  Rect _indicatorRectFor(Rect rect, TextDirection textDirection) {
    assert(rect != null);
    assert(textDirection != null);
    final Rect indicator = insets.resolve(textDirection).deflateRect(rect);
    if (indicatorWidth != 0.0) {
      double centerWidth = indicator.center.dx - insets.horizontal * 0.5;
      // print("centerWidth: " + centerWidth.toString() + "offset: " + insets.horizontal.toString());
      return Rect.fromLTWH(
            centerWidth,
            indicator.bottom - borderSide.width,
            indicatorWidth,
            borderSide.width,
          );
    } else {
      return Rect.fromLTWH(
            indicator.left,
            indicator.bottom - borderSide.width,
            indicator.width,
            borderSide.width,
          );
    }
  }

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration != null);
    assert(configuration.size != null);
    final Rect rect = offset & (configuration.size ?? Size.zero);
    final TextDirection textDirection = configuration.textDirection ?? TextDirection.ltr;
    final Rect indicator = _indicatorRectFor(rect, textDirection).deflate(borderSide.width / 2.0);
    final Paint paint = borderSide.toPaint()..strokeCap = StrokeCap.square;
    canvas.drawLine(indicator.bottomLeft, indicator.bottomRight, paint);
  }
}
