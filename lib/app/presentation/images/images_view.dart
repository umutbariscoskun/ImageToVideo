import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:image_to_video/app/presentation/images/cubit/images_cubit.dart';
import 'package:image_to_video/app/presentation/widget/default_appbar.dart';
import 'package:image_to_video/app/presentation/widget/gradient_square_button.dart';
import 'package:image_to_video/core/constants/app_constants.dart';
import 'package:image_to_video/core/constants/color_constants.dart';
import 'package:image_to_video/core/constants/text_constants.dart';
import 'package:image_to_video/core/di/injectable.dart';
import 'package:image_to_video/core/extension/context_extension.dart';
import 'package:image_to_video/core/router/router.dart';
import 'package:image_to_video/core/shared/helper_functions.dart';

class ImagesView extends StatelessWidget {
  const ImagesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackGroundColor,
      body: SafeArea(
        child: BlocProvider(
          create: (context) => getIt<ImagesCubit>(),
          child: BlocConsumer<ImagesCubit, ImagesState>(
            listenWhen: (previous, current) =>
                previous.isFinished != current.isFinished,
            listener: (_, state) {
              if (state.isFinished) {
                if (context.mounted) {
                  appRouter.pushAndPopUntil(
                    VideosRoute(pushedFromImages: true),
                    predicate: (route) {
                      return route.settings.name == VideosRoute.name;
                    },
                  );
                  appRouter.push(VideoPlayerRoute(videoPath: state.videoPath));
                }
              }
            },
            builder: (context, state) {
              final cubit = context.read<ImagesCubit>();

              return Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const DefaultAppBar(isBackActive: true),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: context.horizontalDefaultPadding),
                        child: Text(
                          TextConstants.photos,
                          style: kLargeTitleStyle(kPurple),
                        ),
                      ),
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.all(20),
                        child: GridView.builder(
                          itemCount: state.pickedImageFileList.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 1,
                            crossAxisCount: 3,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                          ),
                          itemBuilder: (context, index) {
                            return Stack(
                              fit: StackFit.expand,
                              alignment: Alignment.topRight,
                              children: [
                                GradientSquareButton(
                                  onPressed: () => cubit.updateSelectedList(
                                      path: state.pickedImageFileList[index]),
                                  size: Size(160.w, 160.h),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.file(
                                        File(
                                          state.pickedImageFileList[index],
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                if (cubit.checkForSelectedIcon(
                                    path: state.pickedImageFileList[index]))
                                  GestureDetector(
                                    onTap: () => cubit.updateSelectedList(
                                        path: state.pickedImageFileList[index]),
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Container(
                                          width: 160.w,
                                          height: 160.h,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: ColorConstants.blue
                                                .withOpacity(0.4),
                                          ),
                                        ),
                                        Icon(
                                          Icons.check,
                                          color: ColorConstants.whiteColor,
                                          size: 32.sp,
                                        )
                                      ],
                                    ),
                                  )
                              ],
                            );
                          },
                        ),
                      )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GradientSquareButton(
                            radius: 50.r,
                            onPressed: () async =>
                                await cubit.pickMultipleImages(),
                            size: Size(150.w, 50.h),
                            child: Center(
                                child: Text("Add Image",
                                    style: kContentStyleBold(kWhite))),
                          ),
                          Gap(10.w),
                          // if (state.selectedImageFileList.isNotEmpty)
                          AnimatedOpacity(
                            opacity:
                                state.selectedImageFileList.isNotEmpty ? 1 : 0,
                            duration: const Duration(milliseconds: 300),
                            child: GradientSquareButton(
                              radius: 50.r,
                              onPressed: state.selectedImageFileList.isNotEmpty
                                  ? () async => cubit.createVideo()
                                  : () {},
                              size: Size(150.w, 50.h),
                              child: Center(
                                  child: Text("Convert to Video",
                                      style: kContentStyleBold(kWhite))),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  if (state.isConvertProcessStarted && !state.isFinished)
                    Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: kPurple2.withOpacity(0.5),
                              blurRadius: 10,
                              spreadRadius: 2,
                              offset: const Offset(0, 5),
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      width: 200.w,
                      height: 200.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Video is converting",
                            style: kContentStyleBold(kPurple),
                          ),
                          Gap(20.h),
                          const CircularProgressIndicator(
                            color: kPurple,
                          ),
                          Gap(20.h),
                          Text(
                            "${state.progress}%",
                            style: kContentStyleThin(kBlack),
                          ),
                        ],
                      ),
                    )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
