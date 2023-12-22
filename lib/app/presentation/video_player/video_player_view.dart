import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:image_to_video/app/presentation/video_player/cubit/video_player_cubit.dart';
import 'package:image_to_video/app/presentation/widget/default_appbar.dart';
import 'package:image_to_video/core/constants/app_constants.dart';
import 'package:image_to_video/core/di/injectable.dart';
import 'package:image_to_video/core/extension/context_extension.dart';
import 'package:image_to_video/core/shared/helper_functions.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerView extends StatelessWidget {
  final String videoPath;
  const VideoPlayerView({
    super.key,
    required this.videoPath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack,
      body: SafeArea(
        child: BlocProvider(
          create: (context) => getIt<VideoPlayerCubit>(
            param1: videoPath,
          ),
          child: BlocBuilder<VideoPlayerCubit, VideoPlayerState>(
            builder: (context, state) {
              final cubit = context.read<VideoPlayerCubit>();
              if (state.videosStatus == VideoPlayerStatus.success) {
                return Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: context.horizontalDefaultPadding),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: appRouter.pop,
                            child: Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 36.sp,
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                    Gap(200.h),
                    Center(
                      child: SizedBox(
                        width: context.width / 2,
                        height: context.width / 2,
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: SizedBox(
                            width: cubit.controller.value.size.width,
                            height: cubit.controller.value.size.height,
                            child: VideoPlayer(
                              cubit.controller,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
