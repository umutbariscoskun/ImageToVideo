import 'package:flutter/material.dart';

extension MediaQueryExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  double get height => mediaQuery.size.height;
  double get width => mediaQuery.size.width;

  double get bottomPadding => mediaQuery.padding.bottom;
  double get leftPadding => mediaQuery.padding.left;
}
