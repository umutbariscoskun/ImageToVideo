import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_to_video/app/presentation/splash/cubit/splash_cubit.dart';
import 'package:image_to_video/core/constants/app_constants.dart';
import 'package:image_to_video/core/router/router.dart';
import 'package:image_to_video/core/shared/helper_functions.dart';
import 'package:lottie/lottie.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackGroundColor,
      body: BlocProvider(
        create: (context) => SplashCubit(),
        child: BlocListener<SplashCubit, SplashState>(
            listener: (context, state) {
              if (state.isFinished) {
                appRouter.pushAndPopUntil(
                  const HomeRoute(),
                  predicate: (route) {
                    return route.settings.name == HomeRoute.name;
                  },
                );
              }
            },
            listenWhen: (previous, current) =>
                previous.isFinished != current.isFinished,
            child: Center(
              child: LottieBuilder.asset(
                "${assetAnimationFilePath}loading.json",
              ),
            )),
      ),
    );
  }
}
