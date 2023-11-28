import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:image_to_video/core/di/injectable.dart';
import 'package:image_to_video/presentation/images/cubit/images_cubit.dart';

class ImagesView extends StatelessWidget {
  const ImagesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => getIt<ImagesCubit>(),
          child: BlocBuilder<ImagesCubit, ImagesState>(
            builder: (context, state) {
              final cubit = context.read<ImagesCubit>();

              return Column(
                children: [
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.all(20),
                    child: GridView.builder(
                      itemCount: state.imageFileList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 1,
                        crossAxisCount: 3,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 5,
                      ),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => cubit.updateSelectedList(
                              path: state.imageFileList[index].path),
                          child: Stack(
                            alignment: Alignment.topRight,
                            children: [
                              SizedBox(
                                width: 150.w,
                                height: 150.h,
                                child: Image.file(
                                  File(
                                    state.imageFileList[index].path,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              if (cubit.checkForSelectedIcon(
                                  path: state.imageFileList[index].path))
                                const Icon(
                                  Icons.check,
                                  color: Colors.white,
                                )
                            ],
                          ),
                        );
                      },
                    ),
                  )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () async => await cubit.pickMultipleImages(),
                        child: Container(
                          width: 150,
                          height: 50,
                          color: Colors.red,
                        ),
                      ),
                      Gap(10.w),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 150,
                          height: 50,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
