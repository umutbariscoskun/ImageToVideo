part of 'images_cubit.dart';

enum ImageStatus { initial, loading, success, failure }

class ImagesState extends Equatable {
  final ImageStatus imageStatus;

  /// to store images uploaded from gallery
  final List<XFile> imageFileList;

  /// to store current selections to converting mp4
  final List<String> selectedImageFileList;

  final int progress;

  final String videoPath;

  const ImagesState({
    this.imageStatus = ImageStatus.initial,
    this.imageFileList = const <XFile>[],
    this.selectedImageFileList = const <String>[],
    this.progress = 0,
    this.videoPath = "",
  });

  ImagesState copyWith({
    ImageStatus? imageStatus,
    List<XFile>? imageFileList,
    List<String>? selectedImageFileList,
    int? progress,
    String? videoPath,
  }) {
    return ImagesState(
      imageStatus: imageStatus ?? this.imageStatus,
      imageFileList: imageFileList ?? this.imageFileList,
      selectedImageFileList:
          selectedImageFileList ?? this.selectedImageFileList,
      progress: progress ?? this.progress,
      videoPath: videoPath ?? this.videoPath,
    );
  }

  @override
  List<Object> get props => [
        imageStatus,
        imageFileList,
        selectedImageFileList,
        progress,
        videoPath,
      ];
}
