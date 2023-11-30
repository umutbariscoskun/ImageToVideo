// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const HomeView(),
      );
    },
    SplashRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SplashView(),
      );
    },
    ImagesRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const ImagesView(),
      );
    },
    VideosRoute.name: (routeData) {
      final args = routeData.argsAs<VideosRouteArgs>(
          orElse: () => const VideosRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: VideosView(
          pushedFromImages: args.pushedFromImages,
          key: args.key,
        ),
      );
    },
    VideoPlayerRoute.name: (routeData) {
      final args = routeData.argsAs<VideoPlayerRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: VideoPlayerView(
          key: args.key,
          videoPath: args.videoPath,
        ),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          HomeRoute.name,
          path: '/home-view',
        ),
        RouteConfig(
          SplashRoute.name,
          path: '/',
        ),
        RouteConfig(
          ImagesRoute.name,
          path: '/images-view',
        ),
        RouteConfig(
          VideosRoute.name,
          path: '/videos-view',
        ),
        RouteConfig(
          VideoPlayerRoute.name,
          path: '/video-player-view',
        ),
      ];
}

/// generated route for
/// [HomeView]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/home-view',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [SplashView]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [ImagesView]
class ImagesRoute extends PageRouteInfo<void> {
  const ImagesRoute()
      : super(
          ImagesRoute.name,
          path: '/images-view',
        );

  static const String name = 'ImagesRoute';
}

/// generated route for
/// [VideosView]
class VideosRoute extends PageRouteInfo<VideosRouteArgs> {
  VideosRoute({
    bool pushedFromImages = false,
    Key? key,
  }) : super(
          VideosRoute.name,
          path: '/videos-view',
          args: VideosRouteArgs(
            pushedFromImages: pushedFromImages,
            key: key,
          ),
        );

  static const String name = 'VideosRoute';
}

class VideosRouteArgs {
  const VideosRouteArgs({
    this.pushedFromImages = false,
    this.key,
  });

  final bool pushedFromImages;

  final Key? key;

  @override
  String toString() {
    return 'VideosRouteArgs{pushedFromImages: $pushedFromImages, key: $key}';
  }
}

/// generated route for
/// [VideoPlayerView]
class VideoPlayerRoute extends PageRouteInfo<VideoPlayerRouteArgs> {
  VideoPlayerRoute({
    Key? key,
    required String videoPath,
  }) : super(
          VideoPlayerRoute.name,
          path: '/video-player-view',
          args: VideoPlayerRouteArgs(
            key: key,
            videoPath: videoPath,
          ),
        );

  static const String name = 'VideoPlayerRoute';
}

class VideoPlayerRouteArgs {
  const VideoPlayerRouteArgs({
    this.key,
    required this.videoPath,
  });

  final Key? key;

  final String videoPath;

  @override
  String toString() {
    return 'VideoPlayerRouteArgs{key: $key, videoPath: $videoPath}';
  }
}
