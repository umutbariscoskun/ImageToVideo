part of 'videos_cubit.dart';

enum VideosStatus { initial, loading, success, failure }

class VideosState extends Equatable {
  final VideosStatus videosStatus;
  final List<ProjectEntity> projects;

  const VideosState({
    this.videosStatus = VideosStatus.initial,
    this.projects = const <ProjectEntity>[],
  });

  VideosState copyWith({
    VideosStatus? videosStatus,
    List<ProjectEntity>? projects,
  }) {
    return VideosState(
      videosStatus: videosStatus ?? this.videosStatus,
      projects: projects ?? this.projects,
    );
  }

  @override
  List<Object> get props => [
        videosStatus,
        projects,
      ];
}
