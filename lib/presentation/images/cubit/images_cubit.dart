import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_to_video/presentation/images/file_manager.dart';

import 'package:injectable/injectable.dart';

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

  Future<void> init() async {
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
}
