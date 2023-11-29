import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_to_video/app/presentation/widget/gradient_square_button.dart';
import 'package:image_to_video/app/presentation/widget/gradient_text_widget.dart';
import 'package:image_to_video/app/presentation/widget/wave_background.dart';
import 'package:image_to_video/core/constants/app_constants.dart';
import 'package:image_to_video/core/constants/color_constants.dart';
import 'package:image_to_video/core/constants/text_constants.dart';
import 'package:image_to_video/core/extension/context_extension.dart';
import 'package:image_to_video/core/router/router.dart';
import 'package:image_to_video/core/shared/helper_functions.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackGroundColor,
        body: WaveBackground(
          firstColor: kPurple,
          secondColor: kBackGroundColor,
          child: Padding(
            padding: EdgeInsets.only(
                top: context.topPadding,
                left: context.horizontalDefaultPadding,
                right: context.horizontalDefaultPadding),
            child: Column(
              children: [
                SizedBox(height: 100.h),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GradientTextWidget(
                          headerTitle: TextConstants.video,
                          linearGradient: ColorConstants.whiteGradient,
                          textStyle: kBoldLargeTitleStyle(kPurple),
                        ),
                        GradientTextWidget(
                          headerTitle: TextConstants.converter,
                          linearGradient: ColorConstants.whiteGradient,
                          textStyle: kBoldLargeTitleStyle(kPurple),
                        ),
                        Text(
                          "Turn your photos into a video in seconds!",
                          style: kContentStyleThin(ColorConstants.whiteColor),
                        ),
                      ],
                    ),
                    const Spacer()
                  ],
                ),
                Spacer(),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GradientSquareButton(
                        size: Size(150.w, 150.h),
                        onPressed: () => appRouter.push(const ImagesRoute()),
                        child: Icon(
                          Icons.photo,
                          color: Colors.white,
                          size: 75.r,
                        ),
                      ),
                      GradientSquareButton(
                        size: Size(150.w, 150.h),
                        onPressed: () => appRouter.push(const VideosRoute()),
                        child: Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                          size: 75.r,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ));
  }
}
