import 'package:dartz/dartz.dart';
import 'package:image_to_video/app/data/data_source/project_local_data_source.dart';
import 'package:image_to_video/app/data/model/project_local_cache_model.dart';
import 'package:image_to_video/app/domain/entity/project.dart';
import 'package:image_to_video/app/domain/repository/project_local_repository.dart';
import 'package:image_to_video/core/errors/failures.dart';
import 'package:image_to_video/core/usecase/usecase.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProjectLocalRepository)
class ProjectLocalCacheRepositoryImpl implements ProjectLocalRepository {
  ProjectLocalCacheRepositoryImpl(this._projectLocalDataSource);

  final ProjectLocalDataSource _projectLocalDataSource;

  @override
  Future<Either<Failure, void>> addItem(ProjectEntity entity) async {
    try {
      final model = ProjectLocalCacheModel(
        projectId: entity.projectId,
        projectPath: entity.projectPath,
        projectImages: entity.projectImages,
      );

      return Right(await _projectLocalDataSource.addItem(model));
    } on Failure {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, void>> clearAll(NoParams params) async {
    try {
      return Right(await _projectLocalDataSource.clearAll());
    } on Failure {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteAt(int index) async {
    try {
      return Right(await _projectLocalDataSource.deleteAt(index));
    } on Failure {
      return Left(CacheFailure());
    }
  }

  @override
  Either<Failure, List<ProjectEntity>> getValues(NoParams params) {
    try {
      final entityList = <ProjectEntity>[];
      final result = _projectLocalDataSource.getItems();
      if (result != null) {
        entityList.addAll(
          result.map(
            (e) => ProjectEntity(
              projectId: e.projectId,
              projectPath: e.projectPath,
              projectImages: e.projectImages,
            ),
          ),
        );
      }
      return Right(entityList);
    } catch (e) {
      return Left(CacheFailure());
    }
  }
}
