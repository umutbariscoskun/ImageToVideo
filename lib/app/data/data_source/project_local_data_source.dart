import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_to_video/app/data/base/hive_service.dart';
import 'package:image_to_video/app/data/constants/hive_database_key_constants.dart';
import 'package:image_to_video/app/data/constants/hive_type_constants.dart';
import 'package:image_to_video/app/data/model/project_local_cache_model.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ProjectLocalDataSource
    extends BaseHiveServiceForList<ProjectLocalCacheModel> {
  ProjectLocalDataSource() : super(HiveKDatabaseKeyConstants.projectDb);

  @override
  void registerAdapters() {
    if (!Hive.isAdapterRegistered(
      HiveTypeKeyConstants.projectHiveType,
    )) {
      Hive.registerAdapter(ProjectLocalCacheModelAdapter());
    }
  }
}
