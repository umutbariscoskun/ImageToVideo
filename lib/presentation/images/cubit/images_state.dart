part of 'images_cubit.dart';

enum ImageStatus { initial, loading, success, failure }

class ImagesState extends Equatable {
  final ImageStatus imageStatus;

  /// to store images uploaded from gallery
  final List<XFile> imageFileList;

  /// to store current selections to converting mp4
  final List<String> selectedImageFileList;

  const ImagesState({
    this.imageStatus = ImageStatus.initial,
    this.imageFileList = const <XFile>[],
    this.selectedImageFileList = const <String>[],
  });

  ImagesState copyWith({
    ImageStatus? imageStatus,
    List<XFile>? imageFileList,
    List<String>? selectedImageFileList,
  }) {
    return ImagesState(
      imageStatus: imageStatus ?? this.imageStatus,
      imageFileList: imageFileList ?? this.imageFileList,
      selectedImageFileList:
          selectedImageFileList ?? this.selectedImageFileList,
    );
  }

  @override
  List<Object> get props => [
        imageStatus,
        imageFileList,
        selectedImageFileList,
      ];
}
