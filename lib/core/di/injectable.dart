import 'package:get_it/get_it.dart';
import 'package:image_to_video/core/di/injectable.config.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() {
  getIt.init();
}
