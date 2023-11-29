// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:image_to_video/app/data/data_source/project_local_data_source.dart'
    as _i5;
import 'package:image_to_video/app/data/repository/local/project_local_repository_impl.dart'
    as _i7;
import 'package:image_to_video/app/data/service/file_manager.dart' as _i4;
import 'package:image_to_video/app/domain/repository/project_local_repository.dart'
    as _i6;
import 'package:image_to_video/app/domain/usecase/project_entity_use_cases/project_use_cases.dart'
    as _i9;
import 'package:image_to_video/app/presentation/images/cubit/images_cubit.dart'
    as _i11;
import 'package:image_to_video/app/presentation/video_player/cubit/video_player_cubit.dart'
    as _i8;
import 'package:image_to_video/app/presentation/videos/cubit/videos_cubit.dart'
    as _i10;
import 'package:image_to_video/core/router/router.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.AppRouter>(() => _i3.AppRouter());
    gh.factory<_i4.FileManager>(() => _i4.FileManagerImpl());
    gh.lazySingleton<_i5.ProjectLocalDataSource>(
        () => _i5.ProjectLocalDataSource());
    gh.factory<_i6.ProjectLocalRepository>(() =>
        _i7.ProjectLocalCacheRepositoryImpl(gh<_i5.ProjectLocalDataSource>()));
    gh.factoryParam<_i8.VideoPlayerCubit, String, dynamic>((
      videoPath,
      _,
    ) =>
        _i8.VideoPlayerCubit(videoPath: videoPath));
    gh.factory<_i9.AddProjectUseCase>(
        () => _i9.AddProjectUseCase(gh<_i6.ProjectLocalRepository>()));
    gh.factory<_i9.ClearAllProjectUseCase>(
        () => _i9.ClearAllProjectUseCase(gh<_i6.ProjectLocalRepository>()));
    gh.factory<_i9.DeleteProjectUseCase>(
        () => _i9.DeleteProjectUseCase(gh<_i6.ProjectLocalRepository>()));
    gh.factory<_i9.GetProjectsUseCase>(
        () => _i9.GetProjectsUseCase(gh<_i6.ProjectLocalRepository>()));
    gh.factory<_i9.ProjectUseCases>(() => _i9.ProjectUseCases(
          addProjectUseCase: gh<_i9.AddProjectUseCase>(),
          clearAllProjectUseCase: gh<_i9.ClearAllProjectUseCase>(),
          deleteProjectUseCase: gh<_i9.DeleteProjectUseCase>(),
          getProjectsUseCase: gh<_i9.GetProjectsUseCase>(),
        ));
    gh.factory<_i10.VideosCubit>(
        () => _i10.VideosCubit(projectUseCases: gh<_i9.ProjectUseCases>()));
    gh.factory<_i11.ImagesCubit>(() => _i11.ImagesCubit(
          fileManager: gh<_i4.FileManager>(),
          projectUseCases: gh<_i9.ProjectUseCases>(),
        ));
    return this;
  }
}
