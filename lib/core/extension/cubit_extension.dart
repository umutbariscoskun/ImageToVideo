import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_to_video/core/errors/failures.dart';

extension FoldExtension on Cubit {
  Future<T?> foldAsync<T>(
    Future<Either<Failure, T>> Function() result,
  ) async {
    final response = await result();

    return response.fold(
      (l) => throw l,
      (r) => r,
    );
  }
}
