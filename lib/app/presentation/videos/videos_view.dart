import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_to_video/app/presentation/videos/cubit/videos_cubit.dart';
import 'package:image_to_video/app/presentation/widget/default_appbar.dart';
import 'package:image_to_video/app/presentation/widget/gradient_square_button.dart';
import 'package:image_to_video/core/constants/app_constants.dart';
import 'package:image_to_video/core/di/injectable.dart';
import 'package:image_to_video/core/router/router.dart';
import 'package:image_to_video/core/shared/helper_functions.dart';

class VideosView extends StatelessWidget {
  const VideosView({super.key});

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
                children: [
                  const DefaultAppBar(isBackActive: true),
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
                        return GestureDetector(
                          onLongPress: () async =>
                              await cubit.deleteProject(index),
                          child: GradientSquareButton(
                            onPressed: () => appRouter.push(VideoPlayerRoute(
                                videoPath: state.projects[index].projectPath)),
                            size: Size(160.w, 160.h),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.file(
                                  File(
                                    state.projects[index].projectImages.first,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
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
