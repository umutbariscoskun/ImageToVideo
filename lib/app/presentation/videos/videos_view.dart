import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_to_video/app/presentation/videos/cubit/videos_cubit.dart';
import 'package:image_to_video/app/presentation/widget/default_appbar.dart';
import 'package:image_to_video/app/presentation/widget/gradient_square_button.dart';
import 'package:image_to_video/core/constants/app_constants.dart';
import 'package:image_to_video/core/constants/color_constants.dart';
import 'package:image_to_video/core/constants/text_constants.dart';
import 'package:image_to_video/core/di/injectable.dart';
import 'package:image_to_video/core/extension/context_extension.dart';
import 'package:image_to_video/core/router/router.dart';
import 'package:image_to_video/core/shared/helper_functions.dart';

class VideosView extends StatelessWidget {
  const VideosView({this.pushedFromImages = false, super.key});
  final bool pushedFromImages;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackGroundColor,
      body: SafeArea(
        child: BlocProvider(
          create: (context) => getIt<VideosCubit>(),
          child: BlocBuilder<VideosCubit, VideosState>(
            builder: (context, state) {
              final cubit = context.read<VideosCubit>();

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DefaultAppBar(
                    isBackActive: true,
                    backOnPress: () => pushedFromImages
                        ? appRouter.pushAndPopUntil(
                            const HomeRoute(),
                            predicate: (route) {
                              return route.settings.name == HomeRoute.name;
                            },
                          )
                        : appRouter.pop(),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: context.horizontalDefaultPadding),
                    child: Text(
                      TextConstants.video,
                      style: kLargeTitleStyle(kPurple),
                    ),
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: GridView.builder(
                      itemCount: state.projects.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 1,
                        crossAxisCount: 3,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 5,
                      ),
                      itemBuilder: (context, index) {
                        return Stack(
                          alignment: Alignment.center,
                          children: [
                            GestureDetector(
                              onLongPress: () {
                                cubit.updateSelectedList(
                                    id: state.projects[index].projectId);
                              },
                              child: GradientSquareButton(
                                onPressed: () => appRouter.push(
                                    VideoPlayerRoute(
                                        videoPath:
                                            state.projects[index].projectPath)),
                                size: Size(160.w, 160.h),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.file(
                                      File(
                                        state.projects[index].projectImages
                                            .first,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            if (cubit.checkForSelectedIcon(
                                path: state.projects[index].projectId))
                              GestureDetector(
                                onLongPress: () {
                                  cubit.updateSelectedList(
                                      id: state.projects[index].projectId);
                                },
                                onTap: () => cubit.deleteProject(index),
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
                                      Icons.delete,
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
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
