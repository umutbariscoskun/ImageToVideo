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

  const ImagesState({
    this.imageStatus = ImageStatus.initial,
    this.pickedImageFileList = const <String>[],
    this.selectedImageFileList = const <String>[],
    this.progress = 0,
    this.videoPath = "",
  });

  ImagesState copyWith({
    ImageStatus? imageStatus,
    List<String>? pickedImageFileList,
    List<String>? selectedImageFileList,
    int? progress,
    String? videoPath,
  }) {
    return ImagesState(
      imageStatus: imageStatus ?? this.imageStatus,
      pickedImageFileList: pickedImageFileList ?? this.pickedImageFileList,
      selectedImageFileList:
          selectedImageFileList ?? this.selectedImageFileList,
      progress: progress ?? this.progress,
      videoPath: videoPath ?? this.videoPath,
    );
  }

  @override
  List<Object> get props => [
        imageStatus,
        pickedImageFileList,
        selectedImageFileList,
        progress,
        videoPath,
      ];
}
