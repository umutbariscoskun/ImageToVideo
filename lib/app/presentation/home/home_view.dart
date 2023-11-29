import 'package:flutter/material.dart';
import 'package:image_to_video/core/router/router.dart';
import 'package:image_to_video/core/shared/helper_functions.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          GestureDetector(
            onTap: () => appRouter.push(const ImagesRoute()),
            child: Container(
              width: 100,
              height: 200,
              color: Colors.red,
            ),
          ),
          GestureDetector(
            onTap: () => appRouter.push(const VideosRoute()),
            child: Container(
              width: 100,
              height: 200,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
