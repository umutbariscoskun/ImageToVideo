import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_to_video/core/constants/text_constants.dart';
import 'package:image_to_video/core/shared/helper_functions.dart';
import 'package:image_to_video/core/shared/logger.dart';
import 'package:image_to_video/presentation/images/file_manager.dart';
import 'package:ffmpeg_kit_flutter/ffmpeg_kit_config.dart';
import 'package:ffmpeg_kit_flutter/ffmpeg_session.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart';

part 'images_state.dart';

@injectable
class ImagesCubit extends Cubit<ImagesState> {
  final FileManager _fileManager;
  ImagesCubit({
    required FileManager fileManager,
  })  : _fileManager = fileManager,
        super(const ImagesState()) {
    init();
  }
  late final ImagePicker _imagePicker;
  final List<String> _newPaths = [];

  Future<void> init() async {
    await _fileManager.init();
    _imagePicker = ImagePicker();
  }

  Future<void> pickMultipleImages() async {
    List<XFile>? selectedImages = await _imagePicker.pickMultiImage();
    if (selectedImages.isNotEmpty) {}
    final allFiles = <XFile>[];
    allFiles.addAll(state.imageFileList);
    allFiles.addAll(selectedImages);
    emit(state.copyWith(imageFileList: allFiles));
  }

  void updateSelectedList({required String path}) {
    final selectedFiles = <String>[];
    selectedFiles.addAll(state.selectedImageFileList);

    if (selectedFiles.contains(path)) {
      selectedFiles.removeWhere((element) => element == path);

      emit(state.copyWith(selectedImageFileList: selectedFiles));
    } else {
      selectedFiles.add(path);

      emit(state.copyWith(selectedImageFileList: selectedFiles));
    }
  }

  bool checkForSelectedIcon({required String path}) {
    return state.selectedImageFileList.contains(path);
  }

  Future<void> createVideo() async {
    final paths = state.selectedImageFileList;
    final dir = _fileManager.buildNewPath(projectId);
    await dir.create();

    for (var i = 0; i < paths.length; i++) {
      final newPath = await _fileManager.moveFile(
          source: paths[i],
          newPath: buildPath(dir, "image00${i.toString()}.jpg"));

      if (newPath == null) continue;
      // We care here only about relative path
      _newPaths.add(basename(newPath));
    }
    final videoPath =
        '${dir.path}/output_${DateTime.now().millisecondsSinceEpoch}.mp4';
    final videoCommand = _fileManager.getVideoCommand(
      destination: dir,
      outputPath: videoPath,
    );
    final totalDuration =
        paths.length * _fileManager.slideDuration.inMilliseconds;
    final videoSession = await FFmpegSession.create(
      videoCommand,
      null,
      null,
      (statistic) {
        var progress = statistic.getTime() / totalDuration;
        if (progress < 0) progress = 0;
        if (progress > 1) progress = 1;
        emit(state.copyWith(progress: (progress * 100).round()));
      },
    );

    try {
      await FFmpegKitConfig.ffmpegExecute(videoSession);
    } catch (ex, st) {
      logError(st.toString(), st);
      rethrow;
    } finally {
      logInfo(TextConstants.videoProcessIsCompleted);
      FFmpegKitConfig.enableStatisticsCallback();
    }
    emit(state.copyWith(videoPath: videoPath));
    logSuccess("${TextConstants.videoPath} $videoPath");
  }
}
