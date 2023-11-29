import 'package:flutter/material.dart';

class GradientTextWidget extends StatelessWidget {
  const GradientTextWidget({
    super.key,
    required this.headerTitle,
    required this.linearGradient,
    required this.textStyle,
  });

  final String headerTitle;
  final LinearGradient linearGradient;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => linearGradient.createShader(
        Rect.fromLTWH(
          0,
          0,
          bounds.width,
          bounds.height,
        ),
      ),
      child: Text(
        headerTitle,
        textAlign: TextAlign.center,
        style: textStyle,
      ),
    );
  }
}
