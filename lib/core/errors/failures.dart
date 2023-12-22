import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

// General failures
class ServerFailure extends Failure {
  ServerFailure({this.message});
  final Object? message;
}

class FfmpegFailure extends Failure {
  FfmpegFailure({this.message});
  final Object? message;
}

class ImagePickerFailure extends Failure {
  ImagePickerFailure({this.message});
  final Object? message;
}

class CacheFailure extends Failure {}
