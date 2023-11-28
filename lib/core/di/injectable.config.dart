// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:image_to_video/core/router/router.dart' as _i3;
import 'package:image_to_video/presentation/images/cubit/images_cubit.dart'
    as _i5;
import 'package:image_to_video/presentation/images/file_manager.dart' as _i4;
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
    gh.factory<_i5.ImagesCubit>(
        () => _i5.ImagesCubit(fileManager: gh<_i4.FileManager>()));
    return this;
  }
}
