import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension MediaQueryExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  double get height => mediaQuery.size.height;
  double get width => mediaQuery.size.width;

  double get bottomPadding => mediaQuery.padding.bottom;
  double get leftPadding => mediaQuery.padding.left;
  double get topPadding => mediaQuery.padding.top;

  double get horizontalDefaultPadding => 24.w;
}
