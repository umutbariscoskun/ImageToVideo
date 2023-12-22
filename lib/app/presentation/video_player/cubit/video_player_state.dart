part of 'video_player_cubit.dart';

enum VideoPlayerStatus { initial, loading, success, failure }

class VideoPlayerState extends Equatable {
  final VideoPlayerStatus videosStatus;

  const VideoPlayerState({
    this.videosStatus = VideoPlayerStatus.initial,
  });

  VideoPlayerState copyWith({
    VideoPlayerStatus? videosStatus,
  }) {
    return VideoPlayerState(
      videosStatus: videosStatus ?? this.videosStatus,
    );
  }

  @override
  List<Object> get props => [
        videosStatus,
      ];
}
