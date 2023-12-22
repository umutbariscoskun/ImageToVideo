part of 'images_cubit.dart';

enum ImageStatus { initial, loading, success, failure }

class ImagesState extends Equatable {
  final ImageStatus imageStatus;

  /// to store images uploaded from gallery
  final List<String> pickedImageFileList;

  /// to store current selections to converting mp4
  final List<String> selectedImageFileList;

  final int progress;

  final String videoPath;

  final bool isFinished;

  final bool isConvertProcessStarted;

  const ImagesState({
    this.imageStatus = ImageStatus.initial,
    this.pickedImageFileList = const <String>[],
    this.selectedImageFileList = const <String>[],
    this.progress = 0,
    this.videoPath = "",
    this.isFinished = false,
    this.isConvertProcessStarted = false,
  });

  ImagesState copyWith({
    ImageStatus? imageStatus,
    List<String>? pickedImageFileList,
    List<String>? selectedImageFileList,
    int? progress,
    String? videoPath,
    bool? isFinished,
    bool? isConvertProcessStarted,
  }) {
    return ImagesState(
      imageStatus: imageStatus ?? this.imageStatus,
      pickedImageFileList: pickedImageFileList ?? this.pickedImageFileList,
      selectedImageFileList:
          selectedImageFileList ?? this.selectedImageFileList,
      progress: progress ?? this.progress,
      videoPath: videoPath ?? this.videoPath,
      isFinished: isFinished ?? this.isFinished,
      isConvertProcessStarted:
          isConvertProcessStarted ?? this.isConvertProcessStarted,
    );
  }

  @override
  List<Object> get props => [
        imageStatus,
        pickedImageFileList,
        selectedImageFileList,
        progress,
        videoPath,
        isFinished,
        isConvertProcessStarted,
      ];
}
