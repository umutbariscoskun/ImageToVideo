import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:image_to_video/app/data/data_source/project_local_data_source.dart';
import 'package:image_to_video/app/domain/entity/project.dart';
import 'package:image_to_video/app/domain/repository/project_local_repository.dart';
import 'package:image_to_video/core/di/injectable.dart';
import 'package:image_to_video/core/errors/failures.dart';
import 'package:image_to_video/core/usecase/usecase.dart';
import 'package:injectable/injectable.dart';

part 'add_project_use_case.dart';
part 'clear_all_project_use_case.dart';
part 'get_projects_use_case.dart';
part 'delete_project_use_case.dart';

@immutable
@injectable

///Base use case for reaching FfmpegUseCases
///includes all of FfmpegUseCases
///You can call only this: `AddProjectUseCase`
///than use `projectUseCases.addProjectUseCase` for example
class ProjectUseCases {
  const ProjectUseCases({
    required this.addProjectUseCase,
    required this.clearAllProjectUseCase,
    required this.deleteProjectUseCase,
    required this.getProjectsUseCase,
  });

  final AddProjectUseCase addProjectUseCase;
  final ClearAllProjectUseCase clearAllProjectUseCase;
  final GetProjectsUseCase getProjectsUseCase;
  final DeleteProjectUseCase deleteProjectUseCase;

  Future<void> init() async {
    await getIt<ProjectLocalDataSource>().init();
  }

  Future<void> close() async {
    await getIt<ProjectLocalDataSource>().close();
  }
}
