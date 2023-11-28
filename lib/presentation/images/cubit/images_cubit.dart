import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:injectable/injectable.dart';

part 'images_state.dart';

@injectable
class ImagesCubit extends Cubit<ImagesState> {
  ImagesCubit() : super(const ImagesState()) {
    init();
  }
  Future<void> init() async {}
}
