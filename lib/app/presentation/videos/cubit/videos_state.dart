part of 'videos_cubit.dart';

enum VideosStatus { initial, loading, success, failure }

class VideosState extends Equatable {
  final VideosStatus videosStatus;
  final List<ProjectEntity> projects;
  final List<String> deleteList;

  const VideosState({
    this.videosStatus = VideosStatus.initial,
    this.projects = const <ProjectEntity>[],
    this.deleteList = const <String>[],
  });

  VideosState copyWith({
    VideosStatus? videosStatus,
    List<ProjectEntity>? projects,
    List<String>? deleteList,
  }) {
    return VideosState(
      videosStatus: videosStatus ?? this.videosStatus,
      projects: projects ?? this.projects,
      deleteList: deleteList ?? this.deleteList,
    );
  }

  @override
  List<Object> get props => [videosStatus, projects, deleteList];
}
