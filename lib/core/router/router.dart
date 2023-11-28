import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:image_to_video/presentation/home/home_view.dart';
import 'package:image_to_video/presentation/images/images_view.dart';
import 'package:image_to_video/presentation/splash/splash_view.dart';
import 'package:injectable/injectable.dart';

part 'router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomeView, initial: true),
    AutoRoute(page: SplashView),
    AutoRoute(page: ImagesView)
  ],
)
@lazySingleton
class AppRouter extends _$AppRouter {
  AppRouter();
}
