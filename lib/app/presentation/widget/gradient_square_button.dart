import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_to_video/core/constants/app_constants.dart';
import 'package:image_to_video/core/constants/color_constants.dart';

class GradientSquareButton extends StatelessWidget {
  final Widget child;
  final Function() onPressed;
  final Size size;
  final double? radius;
  const GradientSquareButton({
    required this.child,
    required this.onPressed,
    required this.size,
    this.radius,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: kPurple2.withOpacity(0.5),
                blurRadius: 10,
                spreadRadius: 2,
                offset: const Offset(0, 5),
              ),
            ],
            borderRadius: BorderRadius.circular(radius ?? 20.r),
            gradient: ColorConstants.purpleGradient),
        child: child,
      ),
    );
  }
}
