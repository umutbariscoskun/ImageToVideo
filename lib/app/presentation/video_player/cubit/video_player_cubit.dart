import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:video_player/video_player.dart';

part 'video_player_state.dart';

@injectable
class VideoPlayerCubit extends Cubit<VideoPlayerState> {
  VideoPlayerCubit({
    @factoryParam required this.videoPath,
  }) : super(const VideoPlayerState()) {
    init();
  }
  late VideoPlayerController controller;
  final String videoPath;
  Future<void> init() async {
    emit(state.copyWith(videosStatus: VideoPlayerStatus.loading));
    controller = VideoPlayerController.file(File(videoPath))
      ..initialize().then((value) async {
        await controller.setLooping(true);
        await controller.play();
        emit(state.copyWith(videosStatus: VideoPlayerStatus.success));
      });
  }
}
