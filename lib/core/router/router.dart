import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:image_to_video/app/presentation/home/home_view.dart';
import 'package:image_to_video/app/presentation/images/images_view.dart';
import 'package:image_to_video/app/presentation/splash/splash_view.dart';
import 'package:image_to_video/app/presentation/video_player/video_player_view.dart';
import 'package:image_to_video/app/presentation/videos/videos_view.dart';
import 'package:injectable/injectable.dart';

part 'router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomeView),
    AutoRoute(page: SplashView, initial: true),
    AutoRoute(page: ImagesView),
    AutoRoute(page: VideosView),
    AutoRoute(page: VideoPlayerView),
  ],
)
@lazySingleton
class AppRouter extends _$AppRouter {
  AppRouter();
}
