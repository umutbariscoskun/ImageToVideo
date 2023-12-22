import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashState()) {
    init();
  }

  Future<void> init() async {
    await Future.delayed(const Duration(seconds: 2))
        .then((value) => emit(state.copyWith(isFinished: true)));
  }
}
