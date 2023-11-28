import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

              return Container();
            },
          ),
        ),
      ),
    );
  }
}
