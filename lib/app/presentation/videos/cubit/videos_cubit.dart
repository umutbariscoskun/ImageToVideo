import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_to_video/app/domain/entity/project.dart';
import 'package:image_to_video/app/domain/usecase/project_entity_use_cases/project_use_cases.dart';
import 'package:image_to_video/core/extension/cubit_extension.dart';
import 'package:image_to_video/core/usecase/usecase.dart';
import 'package:injectable/injectable.dart';

part 'videos_state.dart';

@injectable
class VideosCubit extends Cubit<VideosState> {
  VideosCubit({
    required ProjectUseCases projectUseCases,
  })  : _projectUseCases = projectUseCases,
        super(const VideosState()) {
    init();
  }
  final ProjectUseCases _projectUseCases;

  Future<void> init() async {
    await _projectUseCases.init();
    await getProjects();
  }

  Future<void> getProjects() async {
    final result = await foldAsync(() async {
      return await _projectUseCases.getProjectsUseCase.call(NoParams());
    });

    if (result != null) {
      emit(state.copyWith(projects: result));
    }
  }
}
