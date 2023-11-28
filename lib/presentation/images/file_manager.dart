import 'dart:io';
import 'dart:isolate';

import 'package:image_to_video/core/extension/number.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

abstract interface class FileManager {
  Duration get slideDuration;

  Directory buildNewPath(int projectId);

  Future<String?> moveFile({
    required String source,
    required String newPath,
  });

  List<String> getVideoCommand({required Directory destination});
  Future<void> init();
}

@Injectable(as: FileManager)
@lazySingleton
class FileManagerImpl implements FileManager {
  late final Directory _dir;

  @override
  Future<void> init() async {
    _dir = await getApplicationDocumentsDirectory();
  }

  @override
  Directory buildNewPath(int projectId) {
    return Directory(buildPath(_dir, 'project$projectId'));
  }

  @override
  List<String> getVideoCommand({required Directory destination}) {
    final videoPath =
        '${destination.path}/output_${DateTime.now().millisecondsSinceEpoch}.mp4';
    return [
      // Transitioning between images
      "-r",
      (1 / (slideDuration.inMilliseconds / 1000))
          .toPrecision(digits: 2)
          .toString(),
      "15",
      "-i",
      "${destination.path}/image%03d.jpg",

      // Override file in case it exists (we got error in past for the project)
      '-y',
      videoPath,
    ];
  }

  @override
  Future<String?> moveFile({required String source, required String newPath}) {
    if (source == newPath) return Future.value(newPath);

    return Isolate.run(() async {
      final file = File(source);
      try {
        await file.rename(newPath);
        return newPath;
      } catch (_) {
        try {
          // If rename fails, copy the source file and then delete it
          await file.copy(newPath);
          file.delete().ignore();
          return newPath;
        } catch (_) {
          return source;
        }
      }
    });
  }

  @override
  Duration get slideDuration => const Duration(seconds: 1);
}

String buildPath(Directory dir, String file) =>
    "${dir.path}${Platform.pathSeparator}${basename(file)}";
