part of 'images_cubit.dart';

enum ImageStatus { initial, loading, success, failure }

class ImagesState extends Equatable {
  final ImageStatus imageStatus;

  const ImagesState({
    this.imageStatus = ImageStatus.initial,
  });

  ImagesState copyWith({
    ImageStatus? imageStatus,
  }) {
    return ImagesState(
      imageStatus: imageStatus ?? this.imageStatus,
    );
  }

  @override
  List<Object> get props => [
        imageStatus,
      ];
}
