part of 'project_use_cases.dart';

@immutable
@injectable
class DeleteProjectUseCase extends UseCase<void, DeleteProjectParams> {
  DeleteProjectUseCase(this._projectLocalRepository);

  final ProjectLocalRepository _projectLocalRepository;

  @override
  Future<Either<Failure, void>> call(
    DeleteProjectParams params,
  ) async {
    final result = _projectLocalRepository.getValues(NoParams());

    if (result.isRight()) {
      final deleted = await _projectLocalRepository.deleteAt(params.index);
      // If the item was not deleted successfully,
      if (deleted.isLeft()) {
        return Left(CacheFailure());
      }
    }
    return const Right(null);
  }
}

class DeleteProjectParams {
  DeleteProjectParams(this.index);
  final int index;
}
