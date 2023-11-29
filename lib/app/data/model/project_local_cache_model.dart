import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_to_video/app/data/constants/hive_type_constants.dart';

part 'project_local_cache_model.g.dart';

@HiveType(typeId: HiveTypeKeyConstants.projectHiveType)
class ProjectLocalCacheModel extends Equatable {
  const ProjectLocalCacheModel({
    required this.projectId,
    required this.projectPath,
    required this.projectImages,
  });

  @HiveField(0)
  final String projectId;
  @HiveField(1)
  final String projectPath;
  @HiveField(2)
  final List<String> projectImages;

  @override
  List<Object?> get props => [
        projectId,
        projectPath,
        projectImages,
      ];
}
