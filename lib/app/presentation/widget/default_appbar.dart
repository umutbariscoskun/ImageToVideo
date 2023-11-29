import 'package:flutter/material.dart';
import 'package:image_to_video/core/constants/app_constants.dart';
import 'package:image_to_video/core/constants/color_constants.dart';
import 'package:image_to_video/core/constants/text_constants.dart';
import 'package:image_to_video/core/extension/context_extension.dart';

class DefaultAppBar extends StatelessWidget {
  final Widget? appBarLeadingWidget;
  final Widget? appBarCenterWidget;
  final bool? isBackActive;
  const DefaultAppBar(
      {this.appBarCenterWidget,
      this.isBackActive,
      this.appBarLeadingWidget,
      super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    EdgeInsets padding = MediaQuery.of(context).padding;
    return Container(
      decoration: BoxDecoration(
        color: kBackGroundColor,
        border: Border(
          bottom: BorderSide(
            color: Colors.black.withOpacity(0.02),
          ),
        ),
      ),
      width: size.width,
      height: padding.top + 68,
      padding: EdgeInsets.only(
        top: padding.top,
        left: context.horizontalDefaultPadding,
        right: context.horizontalDefaultPadding,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (isBackActive ?? false)
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () => Navigator.pop(context),
              child: Row(
                children: [
                  const Icon(
                    Icons.arrow_back_ios,
                    color: kPurple,
                  ),
                  Text(
                    TextConstants.back,
                    style: kTitleStyle(kPurple),
                  ),
                ],
              ),
            ),
          appBarCenterWidget != null
              ? appBarCenterWidget!
              : const SizedBox.shrink(),
          appBarLeadingWidget != null
              ? appBarLeadingWidget!
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
