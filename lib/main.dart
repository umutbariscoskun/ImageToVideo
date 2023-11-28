import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_to_video/core/di/injectable.dart';
import 'package:image_to_video/core/router/route_observer.dart';
import 'package:image_to_video/core/shared/helper_functions.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      designSize: const Size(390, 844),
      builder: (context, child) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.light,
          ),
          child: MaterialApp.router(
            // theme: AppThemeData.lightTheme,
            // darkTheme: AppThemeData.darkTheme,
            // themeMode: ThemeMode.light,
            // locale: context.locale,
            debugShowCheckedModeBanner: false,
            // supportedLocales: context.supportedLocales,
            // localizationsDelegates: context.localizationDelegates,
            routeInformationParser: appRouter.defaultRouteParser(),
            routerDelegate: AutoRouterDelegate(
              appRouter,
              navigatorObservers: () => [
                RouteObservers(),
              ],
            ),
          ),
        );
      },
    );
  }
}
