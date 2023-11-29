import 'package:dartz/dartz.dart';
import 'package:image_to_video/app/domain/entity/project.dart';
import 'package:image_to_video/core/errors/failures.dart';
import 'package:image_to_video/core/usecase/usecase.dart';

abstract class ProjectLocalRepository {
  Future<Either<Failure, void>> clearAll(NoParams params);
  Either<Failure, List<ProjectEntity>> getValues(NoParams params);
  Future<Either<Failure, void>> addItem(ProjectEntity entity);
  Future<Either<Failure, void>> deleteAt(int index);
}
