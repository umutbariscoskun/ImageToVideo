import 'package:image_to_video/core/di/injectable.dart';
import 'package:image_to_video/core/router/router.dart';

final AppRouter appRouter = getIt<AppRouter>();
int get projectId => DateTime.now().millisecondsSinceEpoch;
