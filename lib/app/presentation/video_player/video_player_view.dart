import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_to_video/app/presentation/video_player/cubit/video_player_cubit.dart';
import 'package:image_to_video/core/di/injectable.dart';
import 'package:image_to_video/core/extension/context_extension.dart';
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
      body: SafeArea(
        child: BlocProvider(
          create: (context) => getIt<VideoPlayerCubit>(
            param1: videoPath,
          ),
          child: BlocBuilder<VideoPlayerCubit, VideoPlayerState>(
            builder: (context, state) {
              final cubit = context.read<VideoPlayerCubit>();
              if (state.videosStatus == VideoPlayerStatus.success) {
                return Center(
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
