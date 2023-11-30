part of 'splash_cubit.dart';

class SplashState extends Equatable {
  final bool isFinished;

  const SplashState({
    this.isFinished = false,
  });

  SplashState copyWith({
    bool? isFinished,
  }) {
    return SplashState(
      isFinished: isFinished ?? this.isFinished,
    );
  }

  @override
  List<Object?> get props => [
        isFinished,
      ];
}
