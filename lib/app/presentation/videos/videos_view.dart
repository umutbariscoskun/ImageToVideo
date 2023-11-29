import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_to_video/app/presentation/videos/cubit/videos_cubit.dart';
import 'package:image_to_video/core/di/injectable.dart';

class VideosView extends StatelessWidget {
  const VideosView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => getIt<VideosCubit>(),
          child: BlocBuilder<VideosCubit, VideosState>(
            builder: (context, state) {
              final cubit = context.read<VideosCubit>();

              return Column(
                children: [
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.all(20),
                    child: GridView.builder(
                      itemCount: state.projects.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 1,
                        crossAxisCount: 3,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 5,
                      ),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {},
                          child: Stack(
                            alignment: Alignment.topRight,
                            children: [
                              SizedBox(
                                width: 150.w,
                                height: 150.h,
                                child: Image.file(
                                  File(
                                    state.projects[index].projectImages.first,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  )),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
