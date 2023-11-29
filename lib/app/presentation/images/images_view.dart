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
import 'package:image_to_video/core/di/injectable.dart';

class ImagesView extends StatelessWidget {
  const ImagesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackGroundColor,
      body: SafeArea(
        child: BlocProvider(
          create: (context) => getIt<ImagesCubit>(),
          child: BlocBuilder<ImagesCubit, ImagesState>(
            builder: (context, state) {
              final cubit = context.read<ImagesCubit>();

              return Column(
                children: [
                  const DefaultAppBar(isBackActive: true),
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
                                        borderRadius: BorderRadius.circular(20),
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
                        onPressed: () async => await cubit.pickMultipleImages(),
                        size: Size(150.w, 50.h),
                        child: Center(
                            child: Text("Add Image",
                                style: kContentStyleBold(kWhite))),
                      ),
                      Gap(10.w),
                      // if (state.selectedImageFileList.isNotEmpty)
                      AnimatedOpacity(
                        opacity: state.selectedImageFileList.isNotEmpty ? 1 : 0,
                        duration: const Duration(milliseconds: 300),
                        child: GradientSquareButton(
                          radius: 50.r,
                          onPressed: state.selectedImageFileList.isNotEmpty
                              ? () async => await cubit.createVideo()
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
              );
            },
          ),
        ),
      ),
    );
  }
}
